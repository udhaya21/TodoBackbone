package com.testing;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

@Controller
public class TodoMain {
	PersistenceManager pm = PMF.get().getPersistenceManager();

	@RequestMapping(value = "/fetchQuery", method = RequestMethod.POST)
	public @ResponseBody void fetchQuery(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/signIn", method = RequestMethod.POST)
	public @ResponseBody String signIn(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String email = request.getParameter("emailid");
		String password = request.getParameter("passwordNew");
		Query q = pm.newQuery(GooglePojo.class);
		q.setFilter("email == '" + email + "'");
		List<GooglePojo> results = (List<GooglePojo>) q.execute();

		if (!(results.isEmpty())) {
			for (GooglePojo obj : results) {
				String BackendPassword = obj.getPassword();
				String name = obj.getName();
				if (password.equals(BackendPassword)) {
					HttpSession session = request.getSession();
					session.setAttribute("email", email);
					session.setAttribute("givenName", name);
					response.sendRedirect("/index");
					return "Success";
				} else {
					return "passwordFailure";
				}

			}
			return "Success";

		}

		else {
			return "emailIdFailure";
		}

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public @ResponseBody String signup(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		Query q = pm.newQuery(GooglePojo.class);
		q.setFilter("email == '" + email + "'");
		List<GooglePojo> results = (List<GooglePojo>) q.execute();

		// Checking Email Already Exists/Not
		if (!(results.isEmpty())) {
			return "email already exists";
		}

		// Storing User Info into the database
		else {
			GooglePojo obj = new GooglePojo();
			obj.setEmail(email);
			obj.setName(name);
			obj.setPassword(password);
			pm.makePersistent(obj);
		}
		HttpSession session = request.getSession();
		session.setAttribute("givenName", name);
		session.setAttribute("email", email);
		response.sendRedirect("/index");
		return "Signned up successfully";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/signInCheck", method = RequestMethod.GET)
	public @ResponseBody String signInCheck(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String email = request.getParameter("emailid");
		String password = request.getParameter("password");
		Query q = pm.newQuery(GooglePojo.class);
		q.setFilter("email == '" + email + "'");
		List<GooglePojo> results = (List<GooglePojo>) q.execute();
		// Checking Email and password Exists/Not
		if (!(results.isEmpty())) {
			for (GooglePojo obj : results) {
				String BackendPassword = obj.getPassword();
				if (password.equals(BackendPassword)) {
					return "Success";
				} else {
					return "passwordFailure";
				}
			}
			return "Success";
		}

		else {
			return "emailIdFailure";
		}

	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public @ResponseBody String register(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String email = request.getParameter("emailid");
		Query q = pm.newQuery(GooglePojo.class);
		q.setFilter("email == '" + email + "'");
		@SuppressWarnings("unchecked")
		List<GooglePojo> results = (List<GooglePojo>) q.execute();

		// Checking Email Already Exists/Not
		if (!(results.isEmpty())) {
			return "Failure";
		}

		else {
			return "Success";
		}
	}

	@RequestMapping(value = "/oauth2callback", method = RequestMethod.GET)
	public void oauthcallback(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		Logger log = Logger.getLogger(TodoMain.class.getName());

		// This is a OAuth try
		try {

			String code = request.getParameter("code");
			log.info(code);
			String urlParameters = "code=" + code + "&client_id=" + Setup.CLIENT_ID + "&client_secret="
					+ Setup.CLIENT_SECRET + "&redirect_uri=" + Setup.REDIRECT_URL + "&grant_type=authorization_code";
			URL url = new URL("https://www.googleapis.com/oauth2/v4/token");
			URLConnection conn = url.openConnection();
			conn.setDoOutput(true);
			OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream());
			writer.write(urlParameters);
			writer.flush();
			String line1 = "";
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line;
			while ((line = reader.readLine()) != null) {
				line1 = line1 + line;
			}
			String s = GsonUtility.getJsonElementString("access_token", line1);
			log.info("The access token" + s);
			url = new URL("https://www.googleapis.com/oauth2/v3/userinfo?access_token=" + s);
			conn = url.openConnection();
			line1 = "";
			reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			while ((line = reader.readLine()) != null) {
				line1 = line1 + line;
			}

			GooglePojo data = (GooglePojo) new Gson().fromJson(line1, GooglePojo.class);
			Query query = pm.newQuery(GooglePojo.class);
			String emailId = data.getEmail();
			query.setFilter("email == '" + emailId + "'");
			String name = data.getName();
			String email = data.getEmail();
			String picture = data.getPicture();
			String givenName = data.getGiven_name();
			// Storing user info into the database
			@SuppressWarnings("unchecked")
			List<GooglePojo> results = (List<GooglePojo>) query.execute();
			if (!(results.isEmpty())) {

			} else {
				GooglePojo obj = new GooglePojo();
				obj.setToken(s);
				obj.setEmail(data.email);
				obj.setFamily_name(data.family_name);
				obj.setGiven_name(data.given_name);
				obj.setId(data.id);
				obj.setName(data.name);
				obj.setVerified_email(data.verified_email);
				obj.setPicture(data.picture);
				pm.makePersistent(obj);
				log.info("The email id is" + email);
			}
			HttpSession session = request.getSession();
			session.setAttribute("userName", name);
			session.setAttribute("email", email);
			session.setAttribute("picture", picture);
			session.setAttribute("givenName", givenName);
			writer.close();
			reader.close();
			request.setAttribute("auth", data);
			response.sendRedirect("/index");

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (ProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/facebookLogin", method = RequestMethod.GET)
	public void facebookLogin(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		{
			try {
				String rid = request.getParameter("request_ids");
				if (rid != null) {
					response.sendRedirect("https://www.facebook.com/v2.9/dialog/oauth?client_id="
							+ FacebookCreds.CLIENT_ID + "&redirect_uri=" + FacebookCreds.REDIRECT_URI + "");
				} else {
					String code = request.getParameter("code");
					if (code != null) {
						URL url = new URL("https://graph.facebook.com/v2.9/oauth/access_token?client_id="
								+ FacebookCreds.CLIENT_ID + "&redirect_uri=" + FacebookCreds.REDIRECT_URI
								+ "&client_secret=" + FacebookCreds.CLIENT_SECRET + "&code=" + code);
						HttpURLConnection conn = (HttpURLConnection) url.openConnection();
						conn.setRequestMethod("GET");
						// conn.setConnectTimeout(20000);
						String outputString = "";
						BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
						String line;
						while ((line = reader.readLine()) != null) {
							outputString = outputString + line;
						}
						JSONObject info = new JSONObject(outputString);
						String accessToken = (String) info.getString("access_token");
						url = new URL(
								"https://graph.facebook.com/v2.9/me?fields=gender,email,first_name,last_name,id,picture&access_token="
										+ accessToken);
						HttpURLConnection conn1 = (HttpURLConnection) url.openConnection();
						conn1.setRequestMethod("GET");
						outputString = "";
						reader = new BufferedReader(new InputStreamReader(conn1.getInputStream()));
						String line2 = "";
						while ((line2 = reader.readLine()) != null) {
							outputString = outputString + line2;
						}
						FacebookLogin fbp = (FacebookLogin) new Gson().fromJson(outputString, FacebookLogin.class);
						request.setAttribute("auth", fbp);
						HttpSession session = request.getSession();
						String email = fbp.email;
						String name = fbp.first_name;
						session.setAttribute("givenName", name);
						session.setAttribute("email", email);
						response.sendRedirect("/index");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/signOut", method = RequestMethod.GET)
	public void signOut(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession(false);
		session.invalidate();
		response.sendRedirect("/home");
	}

	@RequestMapping(value = { "/index" })
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}

	@RequestMapping(value = { "/index2" })
	public ModelAndView index2() {
		ModelAndView mav = new ModelAndView("index2");
		return mav;
	}

	@RequestMapping(value = { "/home", "/" })
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home");
		return mav;
	}

	@RequestMapping(value = { "/googleLogin" })
	public ModelAndView googleLogin() {
		ModelAndView mav = new ModelAndView("googleLogin");
		return mav;
	}

	/*
	 * The request to map the SpecRunner
	 */

	@RequestMapping(value = { "/SpecRunner" })
	public ModelAndView specRunner() {
		ModelAndView mav = new ModelAndView("SpecRunner");
		return mav;
	}

	@RequestMapping(value = { "/ajaxcall" }, method = RequestMethod.GET)
	public @ResponseBody String ajaxCalled()
	{
		return "Ajax Called";
	}
//	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//		return "Ajax Called";
//	}

}
