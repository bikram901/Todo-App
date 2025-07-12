package com.example.Todo_App.service;

import java.util.List;

import com.example.Todo_App.model.Todo;

public interface TodoService {
	
	List<Todo> getAllTodoItems();
	
	Todo getTodoItemById(Long id);
	
	boolean saveOrUpdateTodoItem(Todo todo);
	
	boolean updateStatusById(Long id);
	
	boolean deleteTodoItemById(Long id);

}
