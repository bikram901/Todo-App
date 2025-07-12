package com.example.Todo_App.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Todo_App.model.Todo;
import com.example.Todo_App.repo.TodoRepository;


@Service
public class TodoServiceImpl implements TodoService {
	
	@Autowired
	TodoRepository repository;
	
	public List<Todo> getAllTodoItems(){
		
		ArrayList<Todo> todoList = new ArrayList<Todo>();
		repository.findAll().forEach(todo ->todoList.add(todo));
		
		return todoList;
		
	}
	
	public Todo getTodoItemById(Long id){
		
		return repository.findById(id).get();
		
	}
	
	public boolean saveOrUpdateTodoItem(Todo todo){
		
			Todo updatedTodo = repository.save(todo);
			
			if(getTodoItemById(updatedTodo.getId()) != null) {
				
				return true;
			}
			
			return false;
	}
	
	
	public boolean updateStatusById(Long id){
		Todo todo= getTodoItemById(id);
		if(todo != null) {
			todo.setStatus("Complete");
			return saveOrUpdateTodoItem(todo);
		}
		
		return false;
		
	}
	
	public boolean deleteTodoItemById(Long id){
		if(getTodoItemById(id) ==null) {
			
			return false;
		}
		repository.deleteById(id);
		return true;
		
	}

	

}
