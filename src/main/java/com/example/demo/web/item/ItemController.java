package com.example.demo.web.item;

import com.example.demo.domain.item.Item;
import com.example.demo.domain.member.Member;
import com.example.demo.web.item.form.ItemSaveForm;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/items")
@RequiredArgsConstructor
public class ItemController {

    @GetMapping
    public String items(Model model) {
        List<Item> items = new ArrayList<>();
        Item item1 = new Item("test", 10000, 10);
        Item item2 = new Item("test1", 20000, 20);
        item1.setId(1L);
        item2.setId(2L);

        items.add(item1);
        items.add(item2);
        model.addAttribute("items", items);

        return "items/items";
    }

    @GetMapping("/{itemId}")
    public String item(@PathVariable long itemId, Model model) {
        Item item = new Item("test", 10000, 10);
        item.setId(1L);
        model.addAttribute("item", item);
        return "items/item";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("item", new Item());
        return "items/addForm";
    }

    @PostMapping("/add")
    public String assItem(@Validated @ModelAttribute("item") ItemSaveForm form, BindingResult bindingResult, RedirectAttributes redirectAttributes) {

        //특정 필드 예외가 아닌 전체 예외
        if (form.getPrice() != null && form.getQuantity() != null) {
            int resultPrice = form.getPrice() * form.getQuantity();
            if(resultPrice < 1000) {
                bindingResult.reject("totalPriceMin", new Object[]{1000, resultPrice}, null);
            }
        }

        if (bindingResult.hasErrors()) {
            log.info("errors={}", bindingResult);
            return "items/addForm";
        }

        //성공 로직
        Item item = new Item();
        item.setItemName(form.getItemName());
        item.setPrice(form.getPrice());
        item.setQuantity(form.getQuantity());

        redirectAttributes.addAttribute("itemId", 1L);
        redirectAttributes.addAttribute("status", true);

        return "redirect:/items/{itemId}";
    }
}
