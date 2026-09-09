package com.rohith.gcphello;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1/")
public class helloController {

@GetMapping("hello")
public String greet() {
    return "Hello!";
}

@GetMapping("hello2")
public String greet(@RequestParam String name) {
    return "Hello " + name + " !";
}

}
