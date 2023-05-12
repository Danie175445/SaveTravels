package com.daniel.savetravels.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.daniel.savetravels.model.Expense;
import com.daniel.savetravels.service.ExpenseService;

import jakarta.validation.Valid;

@Controller
public class ExpenseController {
	@Autowired
	ExpenseService expenseServise;
	
	@GetMapping("/home")
	public String home(@ModelAttribute("expense") Expense expense,Model model) {
		ArrayList<Expense> expenses = expenseServise.allExpenses();
		model.addAttribute("expenses",expenses);
		return "index.jsp";
	}
	
	@PostMapping("/expense")
	public String create(@Valid @ModelAttribute("expense")Expense expense,BindingResult result,Model model) {
		if(result.hasErrors()) {
			ArrayList<Expense>expenses = expenseServise.allExpenses();
			model.addAttribute("expenses",expenses);
			return "index.jsp";
		}
		else {
			expenseServise.createExpense(expense);
			return "redirect:/home";
		}
	}
	
	@GetMapping("/edit/expense/{id}")
	public String edit(@PathVariable("id")Long id, Model model) {
		Expense expense = expenseServise.findExpense(id);
		model.addAttribute("expense",expense);
		return "edit.jsp";
	}
	
	@RequestMapping(value ="/edit/expense/{id}", method = RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("expense")Expense expense,BindingResult result,Model model) {
		if(result.hasErrors()) {
			model.addAttribute("expense", expense);
			return "edit.jsp";
		}
		else {
			expenseServise.updateExpense(expense);
			return "redirect:/home";
		}
	}
	
	@GetMapping("/show/expense/{id}")
	public String show(@PathVariable("id")Long id,Model model) {
		Expense expense = expenseServise.findExpense(id);
		model.addAttribute("expense",expense);
		return "show.jsp";
	}
	
	@RequestMapping("/delete/expense/{id}")
	public String delete(@PathVariable("id") Long id) {
		expenseServise.destroy(id);
		return "redirect:/home";
	}
}
