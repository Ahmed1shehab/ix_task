import 'package:flutter/material.dart';
import 'package:ix_task/presentation/resource/styles_manager.dart';
import 'package:ix_task/presentation/resource/values_manager.dart';
import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    colorScheme: const ColorScheme.light(
      primary: ColorManager.primary,
      primaryContainer: ColorManager.primaryVariant,
      secondary: ColorManager.secondary,
      secondaryContainer: ColorManager.secondaryVariant,
      surface: ColorManager.surface,
      error: ColorManager.error,
      onPrimary: ColorManager.onPrimary,
      onSecondary: ColorManager.onSecondary,
      onSurface: ColorManager.onSurface,
      onError: ColorManager.onError,
    ),

    // AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorManager.primary,
      elevation: AppSize.s4,
      titleTextStyle: getRegularStyle(
        fontSize: FontSize.s20,
        color: ColorManager.onPrimary,
      ),
    ),

    // Button theme
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      buttonColor: ColorManager.primary,
      textTheme: ButtonTextTheme.primary,
    ),

    // Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        foregroundColor: ColorManager.onPrimary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        textStyle: getMediumStyle(
          fontSize: FontSize.s16,
          color: ColorManager.onPrimary,
        ),
      ),
    ),

    // Text theme
    textTheme: TextTheme(
      headlineLarge: getBoldStyle(
        fontSize: FontSize.s22,
        color: ColorManager.onSurface,
      ),
      headlineMedium: getSemiBoldStyle(
        fontSize: FontSize.s20,
        color: ColorManager.onSurface,
      ),
      bodyLarge: getRegularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.onSurface,
      ),
      bodyMedium: getRegularStyle(
        fontSize: FontSize.s14,
        color: ColorManager.onSurface,
      ),
      bodySmall: getLightStyle(
        fontSize: FontSize.s12,
        color: ColorManager.grey,
      ),
    ),

    // Input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p12),
      hintStyle: getRegularStyle(
        fontSize: FontSize.s14,
        color: ColorManager.grey,
      ),
      labelStyle: getMediumStyle(
        fontSize: FontSize.s14,
        color: ColorManager.primary,
      ),
      errorStyle: getRegularStyle(
        fontSize: FontSize.s12,
        color: ColorManager.error,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorManager.lightGrey,
          width: AppWidth.w1_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorManager.primary,
          width: AppWidth.w2,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorManager.error,
          width: AppWidth.w1_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorManager.error,
          width: AppWidth.w2,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
    ),
  );
}
