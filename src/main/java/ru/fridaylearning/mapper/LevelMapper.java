package ru.fridaylearning.mapper;

import org.mapstruct.*;
import ru.fridaylearning.dto.LevelRequestDto;
import ru.fridaylearning.dto.LevelResponseDto;
import ru.fridaylearning.model.Level;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface LevelMapper extends BaseMapper<Level, LevelRequestDto, LevelResponseDto> {

    @Override
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "units", ignore = true)
    @Mapping(target = "createdAt", ignore = true)
    @Mapping(target = "updatedAt", ignore = true)
    Level toEntity(LevelRequestDto dto);

    @Override
    @Mapping(target = "unitsCount", expression = "java(entity.getUnits().size())")
    LevelResponseDto toDto(Level entity);

    @Override
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "units", ignore = true)
    @Mapping(target = "createdAt", ignore = true)
    @Mapping(target = "updatedAt", ignore = true)
    void updateEntity(@MappingTarget Level entity, LevelRequestDto dto);
} 