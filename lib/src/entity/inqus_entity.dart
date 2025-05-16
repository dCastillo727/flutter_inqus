import 'package:flutter_inqus/src/entity/inqus_page_entity.dart';
import 'package:flutter_inqus/src/entity/text_entity.dart';
import 'package:flutter_inqus/src/interfaces/inqus/element/inqus_element.dart';
import 'package:flutter_inqus/src/interfaces/inqus/element/inqus_element_base.dart';
import 'package:flutter_inqus/src/interfaces/inqus/inqus.dart';
import 'package:flutter_inqus/src/interfaces/inqus/inqus_text.dart';

class InqusEntity extends Inqus {
  factory InqusEntity({
    InqusText? title,
    InqusText? description,
    List<InqusPage>? pages,
    List<InqusElement>? elements,
  }) {
    assert(pages != null || elements != null, 'Either pages or elements must be provided');
    final basePages =
        pages != null && pages.isNotEmpty
            ? pages
            : [InqusPageEntity(name: title ?? elements?.first.name ?? TextEntity(''), elements: elements)];

    return InqusEntity._(title: title, description: description, pages: basePages);
  }

  InqusEntity._({super.title, super.description, required super.pages});
}
