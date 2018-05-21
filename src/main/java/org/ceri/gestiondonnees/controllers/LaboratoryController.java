package org.ceri.gestiondonnees.controllers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.ceri.gestiondonnees.entities.Corpus;
import org.ceri.gestiondonnees.entities.Laboratory;
import org.ceri.gestiondonnees.entities.User;
import org.ceri.gestiondonnees.metier.IUserMetier;
import org.ceri.gestiondonnees.models.CorpusData;
import org.ceri.gestiondonnees.models.LaboratoryData;
import org.ceri.gestiondonnees.models.UserAccount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LaboratoryController {

	@Autowired
	private IUserMetier metier ;
	 
	@RequestMapping(value = "laboratories",  method = RequestMethod.GET)
	public String laboratoriesList(Model model, HttpSession session) {
		if( session.getAttribute("userSession") == null)
			return "redirect:/index";
		Collection<Laboratory> laboratories = metier.getAllLaboratories();
		model.addAttribute("laboratories",laboratories);
		return "data/laboratories";
	}
	
	@RequestMapping(value = "addLaboratory", method = RequestMethod.GET)
	public String addLaboratoryForm(Model model, HttpSession session) {
		if( session.getAttribute("userSession") == null)
			return "redirect:/index";
		model.addAttribute("labData",new LaboratoryData());
		return "forms/createLaboratory";
	}
	
	@RequestMapping(value = "addLab", method = RequestMethod.POST)
	public String createLaboratory(Model model, LaboratoryData labData, HttpSession session) {
		
		if( session.getAttribute("userSession") == null)
			return "redirect:/index";
		
		Laboratory laboratory = metier.getLaboratoryByName(labData.getName());
		if(laboratory == null && labData.getName()!=null) {
			metier.addLaboratory(new Laboratory(labData.getName(), labData.getDescription()));
			return "redirect:laboratories";
		}
		else {
			labData.setErrorMessage("Le laboratoire existant");
			model.addAttribute("labData",labData) ;
			return "forms/createLaboratory";
		}
		
	}
	
	@RequestMapping(value = "deleteLaboratory/{id}", method = RequestMethod.GET)
	public String deleteLaboratory(@PathVariable("id") int id, Model model, HttpSession session) {
		// this controller allows to create a new user account
		
		if( session.getAttribute("userSession") == null)
			return "redirect:/index";
		
		metier.deleteLaboratory(id);
		return "redirect:/laboratories";
	}
	
	
}
