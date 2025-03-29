package site.fridaywords.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import site.fridaywords.dto.UnitResponseDto;
import site.fridaywords.service.UnitService;

@Controller
public class WebController {
    
    private final UnitService unitService;

    public WebController(UnitService unitService) {
        this.unitService = unitService;
    }

    @GetMapping("/training/{unitId}")
    public String showTraining(@PathVariable Long unitId, Model model) {
        UnitResponseDto unit = unitService.getUnitById(unitId);
        model.addAttribute("unit", unit);
        return "training";
    }
}