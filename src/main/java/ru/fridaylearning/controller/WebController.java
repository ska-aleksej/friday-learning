package ru.fridaylearning.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ru.fridaylearning.dto.UnitResponseDto;
import ru.fridaylearning.service.LevelService;
import ru.fridaylearning.service.UnitService;

@Controller
public class WebController {
    
    private final UnitService unitService;
    private final LevelService levelService;

    public WebController(UnitService unitService, LevelService levelService) {
        this.unitService = unitService;
        this.levelService = levelService;
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
    public String showTraining(@PathVariable Long unitId, Model model) {
        try {
            UnitResponseDto unit = unitService.getUnitById(unitId);
            if (unit == null) {
                throw new RuntimeException("Unit not found");
            }
            model.addAttribute("unit", unit);
            return "training";
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    @GetMapping("/unit/{id}/modes")
    public String showModes(@PathVariable Long id, Model model) {
        model.addAttribute("unit", unitService.getUnitById(id));
        return "mode-selection";
    }

    @GetMapping("/memorization/{id}")
    public String showMemorization(@PathVariable Long id, Model model) {
        model.addAttribute("unit", unitService.getUnitById(id));
        return "memorization";
    }

    @GetMapping("/spelling/{id}")
    public String showSpelling(@PathVariable Long id, Model model) {
        model.addAttribute("unit", unitService.getUnitById(id));
        return "spelling";
    }
}