package org.ceri.gestiondonnees.dao;

import org.ceri.gestiondonnees.entities.Laboratory;

public interface ILaboratorDao {

	// add to database 
	public void addLaboratory(Laboratory laboratory);
	
	// consulatation de donn�es 
	public Laboratory getLaboratoryByName(String name);
	
	
}
