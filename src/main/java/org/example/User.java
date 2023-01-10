package org.example;

public class User {
  public Integer id;

  public String getName() {
    return name;
  }

  public User(Integer id, String name) {
    this.id = id;
    this.name = name;
  }

  public String name;

  public User(Integer id) {
    this.id=id;
  }

  public User() {
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }
}
