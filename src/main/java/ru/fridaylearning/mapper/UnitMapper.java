package ru.fridaylearning.mapper;

import org.mapstruct.*;
import ru.fridaylearning.dto.UnitRequestDto;
import ru.fridaylearning.dto.UnitResponseDto;
import ru.fridaylearning.model.Unit;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface UnitMapper extends BaseMapper<Unit, UnitRequestDto, UnitResponseDto> {

    @Override
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "level", ignore = true)
    @Mapping(target = "words", ignore = true)
    @Mapping(target = "createdAt", ignore = true)
    @Mapping(target = "updatedAt", ignore = true)
    Unit toEntity(UnitRequestDto dto);

    @Override
    @Mapping(target = "levelId", source = "level.id")
    @Mapping(target = "levelName", source = "level.name")
    @Mapping(target = "wordsCount", expression = "java(entity.getWords().size())")
    UnitResponseDto toDto(Unit entity);

    @Override
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "level", ignore = true)
    @Mapping(target = "words", ignore = true)
    @Mapping(target = "createdAt", ignore = true)
    @Mapping(target = "updatedAt", ignore = true)
    void updateEntity(@MappingTarget Unit entity, UnitRequestDto dto);
} 