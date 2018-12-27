package me.vitan.bean;
import java.util.*;

public class logins {
   String Username="",
          backNews="未登录";
   LinkedList<String> car; //加入
   public logins() {
      car = new LinkedList<String>();
   }
   public void setUsername(String Username){  
      this.Username = Username;
   }
   public String getUsername(){
      return Username;
   }
   public void setBackNews(String s) {
      backNews = s;
   } 
   public String getBackNews(){
      return backNews;
   }
   public LinkedList<String> getCar() { 
      return car;
   }
}
