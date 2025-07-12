package com.example.Todo_App.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.Todo_App.model.Todo;
import com.example.Todo_App.service.TodoService;

@RestController
public class TodoController {
	
	@Autowired
	private TodoService service;
	
	private static final ModelAndView modelAndView = new ModelAndView();

	@GetMapping(path = {"/","/index"})
	public ModelAndView viewAllTodoItems() {
		List<Todo> todoList =  service.getAllTodoItems();
		
		modelAndView.addObject("list", todoList);
		modelAndView.setViewName("home");
		
		return modelAndView;	
	}
	
	@GetMapping(path = "/updateTodoStatus/{id}")
	public ModelAndView updateTodoStatus(@PathVariable Long id) {
		if(service.updateStatusById(id)) {
			modelAndView.addObject("message", "Update Sucess");
			modelAndView.setViewName("redirect:/index");
			return modelAndView;
		}
		
		modelAndView.addObject("message", "Update Failure");

		modelAndView.setViewName("redirect:/index");
		return modelAndView;	
	}
	
	@GetMapping(path = "/createTodoItem")
	public ModelAndView createTodoItem() {
		modelAndView.addObject("todo", new Todo());
		modelAndView.setViewName("createTodoItem");
		return modelAndView;		
	}
	
	@PostMapping(path = "/saveTodoItem")
	public ModelAndView saveTodoItem(Todo todo) {
		
		if(service.saveOrUpdateTodoItem(todo)) {
			modelAndView.addObject("message", "Todo Listed");
			
			modelAndView.setViewName("redirect:/index");
			return modelAndView;
		}
		modelAndView.addObject("message", "Error on Todo Listing");
		modelAndView.setViewName("redirect:/index");
		return modelAndView;		
	}
	
	@GetMapping(path = "/editTodoItem/{id}")
	public ModelAndView editTodoItem(@PathVariable Long id) {
		Todo todo = service.getTodoItemById(id);
		modelAndView.addObject("todo" , todo);
		modelAndView.setViewName("editTodoItem");
		return modelAndView;		
	}
	
	@GetMapping(path = "/editSaveTodoItem")
	public ModelAndView editsaveTodoItem(Todo todo) {
		if(service.saveOrUpdateTodoItem(todo)) {
			modelAndView.addObject("message", "Todo Edited");
			modelAndView.setViewName("redirect:/index");
			return modelAndView;
		}
		modelAndView.addObject("message", "Error on Todo Editing");
		modelAndView.setViewName("redirect:/editTodoItem");
		return modelAndView;
			
	}
	
	
	
	@GetMapping(path = "/deleteTodoItem/{id}")
	public ModelAndView deleteTodoItem(@PathVariable Long id) {
		
		if(service.deleteTodoItemById(id)) {
			modelAndView.addObject("message", "Todo Deleted");
			modelAndView.setViewName("redirect:/index");
			return modelAndView;
		}
		modelAndView.addObject("message", "Error on Todo Deleting");
		modelAndView.setViewName("redirect:/index");
		return modelAndView;	
	}
	
	
	
}
