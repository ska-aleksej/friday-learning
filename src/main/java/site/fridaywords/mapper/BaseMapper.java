package site.fridaywords.mapper;

import org.mapstruct.MappingTarget;
import java.util.List;

public interface BaseMapper<E, RQ, RS> {
    E toEntity(RQ dto);
    RS toDto(E entity);
    List<RS> toDtoList(List<E> entities);
    void updateEntity(@MappingTarget E entity, RQ dto);
} 