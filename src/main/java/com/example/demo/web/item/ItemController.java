package com.example.demo.web.item;

import com.example.demo.domain.item.*;
import com.example.demo.domain.member.Member;
import com.example.demo.web.item.form.ItemSaveForm;
import com.example.demo.web.item.form.ItemUpdateForm;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Controller
@RequestMapping("/items")
@RequiredArgsConstructor
public class ItemController {

    private final ItemMapper itemMapper;

    @ModelAttribute("itemTypes")
    public ItemType[] itemTypes() {
        return ItemType.values();
    }

    @ModelAttribute("regions")
    public Map<String, String> regions() {
        Map<String, String> regions = new LinkedHashMap<>();
        regions.put("SEOUL", "서울");
        regions.put("BUSAN", "부산");
        regions.put("JEJU", "제주");
        return regions;
    }

    @ModelAttribute("deliveryCodes")
    public DeliveryCode[] deliveryCodes() {
        return DeliveryCode.values();
    }

    @GetMapping
    public String items(Model model) {
        List<Item> items = itemMapper.findAll();
        model.addAttribute("items", items);
        return "items/items";
    }

    @GetMapping("/{itemId}")
    public String item(@PathVariable long itemId, Model model) {
//        Item item = itemMapper.findById(itemId);
        Map<String, Object> itemIdMap = new HashMap<>();
        itemIdMap.put("id", itemId);
//        Map<String, Object> itemMap = itemMapper.findById(itemId);
        Map<String, Object> itemMap = itemMapper.findById(itemIdMap);
        ObjectMapper mapper = new ObjectMapper();
        Item item = mapper.convertValue(itemMap, Item.class);
        List<String> regions = Arrays.asList(item.getRegions().split(","));
        System.out.println("regions = " + regions);
        model.addAttribute("selectedRegion", regions);
        model.addAttribute("item", itemMap);
        return "items/item";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("item", new Item());
        return "items/addForm";
    }

    @PostMapping("/add")
    public String addItem(@Validated @ModelAttribute("item") ItemSaveForm form, BindingResult bindingResult, RedirectAttributes redirectAttributes) {



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
        item.setOpen(form.getOpen());
        item.setItemType(form.getItemType());
        item.setDeliveryCode(form.getDeliveryCode());

        //String regions = form.getRegions().stream().collect(Collectors.joining(","));
        List<String> regions1 = form.getRegions();
        String regions = "";
        int size = form.getRegions().size();
        for (int i = 0; i < size; i++) {
            if ("".equals(regions)) {
                regions += regions1.get(i);
            }
            else {
                regions += "," + regions1.get(i);
            }
        }

        item.setRegions(regions);

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> itemMap = mapper.convertValue(item, Map.class);

        itemMapper.saveItem(itemMap);
//        Long id = itemMap.getId();
        Long id = (Long) itemMap.get("id");

        redirectAttributes.addAttribute("itemId", id);
        redirectAttributes.addAttribute("status", true);

        return "redirect:/items/{itemId}";
    }

    @GetMapping("/{itemId}/edit")
    public String editForm(@PathVariable Long itemId, Model model) {
//        Item item = itemMapper.findById(itemId);
        Map<String, Object> itemIdMap = new HashMap<>();
        itemIdMap.put("id", itemId);
//        Map<String, Object> itemMap = itemMapper.findById(itemId);
        Map<String, Object> itemMap = itemMapper.findById(itemIdMap);
        ObjectMapper mapper = new ObjectMapper();
        Item item = mapper.convertValue(itemMap, Item.class);
        List<String> regions = Arrays.asList(item.getRegions().split(","));
        model.addAttribute("selectedRegion", regions);
        model.addAttribute("item", item);
        return "items/editForm";
    }

    @PostMapping("{itemId}/edit")
    public String editItem(@PathVariable Long itemId, @Validated @ModelAttribute("item") ItemUpdateForm form, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            log.info("errors={}", bindingResult);
            return "items/editForm";
        }

        //성공 로직
        Item itemParam = new Item();
        itemParam.setId(itemId);
        itemParam.setItemName(form.getItemName());
        itemParam.setPrice(form.getPrice());
        itemParam.setQuantity(form.getQuantity());
        itemParam.setOpen(form.getOpen());
        itemParam.setItemType(form.getItemType());
        itemParam.setDeliveryCode(form.getDeliveryCode());
        String regions = form.getRegions().stream().collect(Collectors.joining(","));
        itemParam.setRegions(regions);

        itemMapper.updateItem(itemParam);
        return "redirect:/items/{itemId}";
    }

    @PostMapping("/delete")
    public String deleteItem(@RequestParam Long itemId) {

        itemMapper.deleteItem(itemId);

        return "redirect:/items";
    }
}
