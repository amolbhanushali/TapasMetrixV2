package com.session;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import com.bean.UserMaster;

/**
 * Servlet implementation class SessionListener
 */
/**
 * 
 * @author Sandip Kumar Ranjan
 *
 */
@WebServlet("/SessionListener")
public class SessionListener extends HttpServlet implements HttpSessionListener {

	private static final long serialVersionUID = 1L;

	private int sessionCount = 0;
	
	private boolean isLogout = false;

	@Override
	public void sessionCreated(HttpSessionEvent event) {

		synchronized (this) {
			sessionCount++;
		}
		System.out.println("Session Created: " + event.getSession().getId());
		System.out.println("Total Sessions: " + sessionCount);
		
		
		/*HttpSession session = event.getSession();
		sessionId = session.getId();
		isLogout = false; 
		session.setAttribute("WpbsSessionHandler", this);
		System.out.println("<-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><->");
		System.out.println("Session Id ::- " + event.getSession().getId());
		System.out.println("<-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><-><->");
		System.out.println();*/
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {

		synchronized (this) {
			sessionCount--;
		}
		System.out.println("Session Destroyed: " + event.getSession().getId());
		System.out.println("Total Sessions: " + sessionCount);
		
		
		HttpSession session = event.getSession();
		UserMaster userMaster = (UserMaster)session.getAttribute("UserMaster");
		//if (MetrixDataController.username == null) {
		
			if (userMaster!= null && userMaster.getUserName() == null) {
				
			session.invalidate();
		}
	}

	public boolean isLogout() {
		return isLogout;
	}

	public void setLogout(boolean logout) {
		isLogout = logout;
	}

	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SessionListener() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}