package org.ceri.gestiondonnees.tests;

import java.util.Collection;

import javax.annotation.Resource;
import javax.jws.soap.SOAPBinding.Use;

import org.ceri.gestiondonnees.entities.Permission;
import org.ceri.gestiondonnees.entities.Role;
import org.ceri.gestiondonnees.entities.User;
import org.ceri.gestiondonnees.metier.IUserMetier;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

public class MainTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		IUserMetier metier = (IUserMetier) context.getBean("businessLogic");
		/* ----------------   �criture ddans la base de donn�es -----------------------*
	
		metier.addRole(new Role("Admin"));
		metier.addRole(new Role("Admin","this is the administrator role"));
		metier.addRole(new Role("Student"));
		metier.addRole(new Role("Professor"));
		
		metier.addDroit(new Permission("oui","oui","oui","oui"));
		metier.addDroit(new Permission("oui","oui","oui","non"));
		metier.addDroit(new Permission("oui","oui","non","non"));
		metier.addDroit(new Permission("oui","non","non","non"));
		metier.addDroit(new Permission("oui","oui","oui","oui"));
		*/
		metier.addUser(new User("el khattab", "mahmoud", "machin@gmail.com", "abcde"));
		metier.addUser(new User("last name 1", "first name 1", "mail1@gmail.com", "password1"));
		metier.addUser(new User("last name 2", "first name 2", "mail2@gmail.com", "password2"));
		System.out.println("tout s'est bien pass�");
	
		
	/* ----------------   consultation de donn�es de la base de donn�es -----------------------*/
	//*				
	//	User u = metier.getUser(1);
	//	metier.addDroit(new Permission("oui","oui","oui","oui"));
		
	//	System.out.println("l'utilisateur est : "+u.getNom()+" "+u.getPrenom());
	//*/
	}

}
