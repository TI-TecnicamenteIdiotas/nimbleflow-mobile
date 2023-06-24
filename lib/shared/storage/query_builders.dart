import '../constants/storage_constants.dart';

String buildProductWithRelationsQuery(String productId) {
  return """SELECT
        $kProductTableName.id AS ${kProductTableName}_id,
        $kProductTableName.title AS ${kProductTableName}_title,
        $kProductTableName.description AS ${kProductTableName}_description,
        $kProductTableName.price AS ${kProductTableName}_price,
        $kProductTableName.imageUrl AS ${kProductTableName}_imageUrl,
        $kProductTableName.isFavorite AS ${kProductTableName}_isFavorite,
        $kCategoryTableName.id AS ${kCategoryTableName}_id,
        $kCategoryTableName.title AS ${kCategoryTableName}_title,
        $kCategoryTableName.colorTheme AS ${kCategoryTableName}_colorTheme,
        $kCategoryTableName.categoryIcon AS ${kCategoryTableName}_categoryIcon
        FROM $kProductTableName
        INNER JOIN $kCategoryTableName AS $kCategoryTableName
        ON $kProductTableName.categoryId = $kCategoryTableName.id
        WHERE $kProductTableName.id = '$productId'""";
}
