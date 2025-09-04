// Centralized app sizing constants for padding, spacing, font sizes, etc.
// Organized for readability and easy maintainability.
class AppSizes {
  AppSizes._(); // Private constructor to prevent instantiation

  static const spacing = _Spacing();
  static const padding = _Padding();
  static const icon = _IconSizes();
  static const font = _FontSizes();
  static const borderRadius = _BorderRadius();
  static const card = _CardSizes();
  static const appBar = _AppBarSizes();
  static const image = _ImageSizes();
  static const inputField = _InputFieldSizes();
  static const divider = _DividerSizes(); // <-- Keep only one of these
  static const height = _HeightSizes();
  static const width = _WidthSizes();
  static const loading = _LoadingSizes();
  static const grid = _GridSizes();
  static const product = _ProductSizes();
  static const borderWidth = _BorderWidths();

  // Common shortcuts / aliases for easier use
  static double cardRadius = card.radiusMd;
  static double imageRadius = borderRadius.md;
  static double searchBarRadius = borderRadius.md;
  static double defaultSpacing = spacing.md;
  static double screenPadding = padding.page;
  static double inputRadius = inputField.radius;
  static double buttonRadius = borderRadius.md;
}

// Spacing constants for widget gaps and element separation
class _Spacing {
  const _Spacing();

  final double xs = 4.0;
  final double sm = 8.0;
  final double smd = 12.0;
  final double md = 16.0;
  final double lg = 24.0;
  final double xl = 32.0;

  // Semantic spacing
  final double betweenSections = 32.0;
  final double betweenSectionsLarge = 48.0;
  final double betweenItems = 16.0;
  final double betweenItemsSmall = 8.0;
  final double betweenCategories = 12.0;
}

// Insets for padding/margin
class _Padding {
  const _Padding();

  final double xs = 4.0;
  final double sm = 8.0;
  final double smd = 12.0;
  final double md = 16.0;
  final double lg = 24.0;
  final double xl = 32.0;

  // Custom values
  final double custom10 = 10.0;
  final double custom14 = 14.0;
  final double custom20 = 20.0;

  // Default page horizontal padding
  final double page = 16.0;
}

// Icon sizes
class _IconSizes {
  const _IconSizes();

  final double xs = 12.0;
  final double sm = 16.0;
  final double md = 20.0;
  final double lg = 24.0;
  final double xl = 32.0;
}

// Font sizes
class _FontSizes {
  const _FontSizes();

  final double xs = 12.0;
  final double sm = 14.0;
  final double md = 16.0;
  final double lg = 18.0;
  final double xl = 20.0;
  final double xxl = 22.0;
}

// Border radii
class _BorderRadius {
  const _BorderRadius();

  final double xs = 4.0;
  final double sm = 8.0;
  final double md = 12.0;
  final double lg = 16.0;
  final double xl = 24.0;
}

// Card sizes
class _CardSizes {
  const _CardSizes();

  final double radiusXs = 6.0;
  final double radiusSm = 10.0;
  final double radiusMd = 12.0;
  final double radiusLg = 16.0;
  final double elevation = 2.0;
}

// Divider thicknesses
class _DividerSizes {
  const _DividerSizes();

  final double thin = 0.5;
  final double regular = 1.0;
  final double thick = 2.0;
  final double extraThick = 5.0;
}

// AppBar height
class _AppBarSizes {
  const _AppBarSizes();

  final double height = 56.0;
}

// Image sizes
class _ImageSizes {
  const _ImageSizes();

  final double thumbnail = 80.0;
  final double carouselHeight = 200.0;
}

// Input field dimensions
class _InputFieldSizes {
  const _InputFieldSizes();

  final double radius = 12.0;
  final double spaceBetween = 16.0;
}

// Loading spinner dimensions
class _LoadingSizes {
  const _LoadingSizes();

  final double indicator = 36.0;
}

// Grid spacing
class _GridSizes {
  const _GridSizes();

  final double spacing = 16.0;
}

// Product card UI sizes
class _ProductSizes {
  const _ProductSizes();

  final double imageSize = 120.0;
  final double imageRadius = 16.0;
  final double itemHeight = 160.0;
}

// Common height values
class _HeightSizes {
  const _HeightSizes();

  final double xs = 24.0;
  final double sm = 36.0;
  final double md = 48.0;
  final double lg = 56.0;
  final double xl = 64.0;
  final double xxl = 76.0;

  final double input = 48.0;
  final double button = 56.0;
  final double appBar = 56.0;
  final double bottomNavBar = 72.0;
  final double chip = 32.0;
}

// Common width values
class _WidthSizes {
  const _WidthSizes();

  final double xs = 40.0;
  final double sm = 64.0;
  final double md = 96.0;
  final double lg = 128.0;
  final double xl = 160.0;

  // Semantic widths
  final double button = 200.0;
  final double input = double.infinity;
  final double image = 120.0;
  final double avatar = 48.0;
  final double full = double.infinity;
}

// Border width constants
class _BorderWidths {
  const _BorderWidths();

  final double thin = 0.5;
  final double regular = 1.0;
  final double thick = 2.0;
  final double extraThick = 4.0;
}
