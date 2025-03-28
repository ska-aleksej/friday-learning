package site.fridaywords.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import site.fridaywords.service.LevelService;
import site.fridaywords.service.UnitService;

@Controller
public class WebController {
    
    private final LevelService levelService;
    private final UnitService unitService;

    public WebController(LevelService levelService, UnitService unitService) {
        this.levelService = levelService;
        this.unitService = unitService;
    }

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("levels", levelService.getAllLevels());
        return "index";
    }

    @GetMapping("/level/{levelId}")
    public String units(@PathVariable Long levelId, Model model) {
        model.addAttribute("level", levelService.getLevelById(levelId));
        model.addAttribute("units", unitService.getUnitsByLevelId(levelId));
        return "units";
    }

    @GetMapping("/training/{unitId}")
    public String training(@PathVariable Long unitId, Model model) {
        model.addAttribute("unit", unitService.getUnitById(unitId));
        return "training";
    }
} 