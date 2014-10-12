package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.orange.db.DBManager;

public class InitillerListener implements ServletContextListener{

	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("Tomcat inited!");
		DBManager.instance();
	}

	public void contextDestroyed(ServletContextEvent sce) {
			
	}
	
}
