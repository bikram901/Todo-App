package com.example.Todo_App.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.Todo_App.model.Todo;

@Repository
public interface TodoRepository extends JpaRepository<Todo, Long>{

}
