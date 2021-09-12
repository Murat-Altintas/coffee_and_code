// ignore_for_file: lines_longer_than_80_chars
import 'dart:ui';
import 'package:flutter/material.dart';
import "es.dart";
import "tr.dart";
import "ar.dart";
import "ru.dart";
import "en.dart";

//ignore: avoid_classes_with_only_static_members
abstract class TData {
  static Map<String, Map<String, String>> byKeys = getByKeys();
  static Map<String, Map<String, String>> getByKeys() => {
        "es": LocaleEs.data,
        "tr": LocaleTr.data,
        "ar": LocaleAr.data,
        "ru": LocaleRu.data,
        "en": LocaleEn.data,
      };

  static Map<String, Map<String, String>>? _byText;
  static Map<String, Map<String, String>> get byText {
    _byText ??= getByText();
    return _byText!;
  }

  static Map<String, Map<String, String>> getByText() {
    final source = getByKeys();
    final output = <String, Map<String, String>>{};
    final master = source[AppLocales.available.first.key]!;
    for (final localeKey in source.keys) {
      output[localeKey] = mapLocaleKeysToMasterText(
        source[localeKey]!,
        masterMap: master,
      );
    }
    return output;
  }

  static Map<String, String> mapLocaleKeysToMasterText(
    Map<String, String> localeMap, {
    Map<String, String>? masterMap,
  }) {
    final output = <String, String>{};
    final _masterMap =
        masterMap ?? TData.byKeys[AppLocales.available.first.key]!;
    for (var k in localeMap.keys) {
      output[_masterMap[k]!] = localeMap[k]!;
    }
    return output;
  }
}

//ignore: avoid_classes_with_only_static_members
abstract class AppLocales {
  static const en = LangVo("English", "English", "en", Locale("en"), "🇬🇧");
  static const es = LangVo("Español", "Spanish", "es", Locale("es"), "🇪🇸");
  static const tr = LangVo("Türkçe", "Turkish", "tr", Locale("tr"), "🇹🇷");
  static const ar = LangVo("العربية", "Arabic", "ar", Locale("ar"), "🇸🇦");
  static const ru = LangVo("Русский", "Russian", "ru", Locale("ru"), "🇷🇺");
  static const available = <LangVo>[en, es, tr, ar, ru];
  static List<Locale> get supportedLocales =>
      [en.locale, es.locale, tr.locale, ar.locale, ru.locale];
  static Locale get systemLocale => window.locale;
  static List<Locale> get systemLocales => window.locales;
  static LangVo? of(Locale locale, [bool fullMatch = false]) {
    for (final langVo in AppLocales.available) {
      if ((!fullMatch && langVo.locale.languageCode == locale.languageCode) ||
          langVo.locale == locale) {
        return langVo;
      }
    }
    return null;
  }
}

class LangVo {
  final String nativeName, englishName, key, flagChar;
  final Locale locale;
  const LangVo(this.nativeName, this.englishName, this.key, this.locale,
      [this.flagChar = '']);
  @override
  String toString() =>
      'LangVo {nativeName: "$nativeName", englishName: "$englishName", locale: $locale, emoji: this.flagChar}';
}

/// demo widget

/// Dropdown menu with available locales.
/// Useful to test changing Locales.
class SimpleLangPicker extends StatelessWidget {
  final Locale? selected;
  final Function(Locale) onSelected;
  const SimpleLangPicker({
    Key? key,
    this.selected,
    required this.onSelected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _selected = selected ?? AppLocales.supportedLocales.first;
    return PopupMenuButton<Locale>(
      tooltip: 'Select language',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.translate,
              size: 16,
            ),
            SizedBox(width: 8),
            Text(AppLocales.of(_selected)?.englishName ?? '-')
          ],
        ),
      ),
      initialValue: _selected,
      onSelected: onSelected,
      itemBuilder: (_) {
        return AppLocales.available
            .map(
              (e) => PopupMenuItem<Locale>(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            e.englishName,
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: -0.2,
                              fontWeight: FontWeight.w300,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${e.nativeName}',
                            style: TextStyle(
                              fontSize: 11,
                              letterSpacing: .15,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      e.key.toUpperCase(),
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                value: e.locale,
              ),
            )
            .toList(growable: false);
      },
    );
  }
}
