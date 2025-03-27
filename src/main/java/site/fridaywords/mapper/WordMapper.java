package site.fridaywords.mapper;

import org.mapstruct.*;
import site.fridaywords.dto.WordRequestDto;
import site.fridaywords.dto.WordResponseDto;
import site.fridaywords.model.Word;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface WordMapper extends BaseMapper<Word, WordRequestDto, WordResponseDto> {

    @Override
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "unit", ignore = true)
    @Mapping(target = "createdAt", ignore = true)
    @Mapping(target = "updatedAt", ignore = true)
    Word toEntity(WordRequestDto dto);

    @Override
    @Mapping(target = "unitId", source = "unit.id")
    @Mapping(target = "unitName", source = "unit.name")
    WordResponseDto toDto(Word entity);

    @Override
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "unit", ignore = true)
    @Mapping(target = "createdAt", ignore = true)
    @Mapping(target = "updatedAt", ignore = true)
    void updateEntity(@MappingTarget Word entity, WordRequestDto dto);
} 