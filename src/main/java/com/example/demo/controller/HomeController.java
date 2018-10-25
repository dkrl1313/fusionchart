package com.example.demo.controller;

import com.example.demo.dao.PopKeywordDao;
import com.example.demo.domain.KeywordList;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private PopKeywordDao popKeywordDao;

    @RequestMapping(value="/logout")
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/";
    }

    @GetMapping("/")
    public String helloWorld(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        List<KeywordList> keywordList = popKeywordDao.getKeywordList("20180528");
        List<KeywordList> keywordList2 = popKeywordDao.getKeywordList("20180527");
        ObjectMapper mapper = new ObjectMapper();
        String json = null;
        String json2 = null;
        try {
            json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(keywordList);
            json2 = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(keywordList2);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        model.addAttribute("keywordList", json);
        model.addAttribute("keywordList2", json2);

        return "home";
    }

    @GetMapping("/bidding")
    public String bidding() {

        return "bidding_chart";
    }

}
