package com.daniel.savetravels.service;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daniel.savetravels.model.Expense;
import com.daniel.savetravels.repository.ExpenseRepository;

@Service
public class ExpenseService {
	@Autowired
	ExpenseRepository expenseRepository;
	
	public ArrayList<Expense> allExpenses() {
		return expenseRepository.findAll();
	}
	
	public Expense createExpense(Expense expense) {
		return expenseRepository.save(expense);
	}
	
	public Expense findExpense(Long id) {
		Optional<Expense> optionalExpense =expenseRepository.findById(id);
		if(optionalExpense.isPresent()) {
			return optionalExpense.get();
		}
		else {
			return null;
		}
	}
	
	public Expense updateExpense(Expense expense) {
		return expenseRepository.save(expense);
	}
	
	public void destroy(Long id) {
		expenseRepository.deleteById(id);
	}
	
}
