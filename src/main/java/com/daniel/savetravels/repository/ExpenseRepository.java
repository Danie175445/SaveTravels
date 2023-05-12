package com.daniel.savetravels.repository;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.daniel.savetravels.model.Expense;

@Repository
public interface ExpenseRepository extends CrudRepository<Expense,Long>{
	ArrayList<Expense> findAll();

}
