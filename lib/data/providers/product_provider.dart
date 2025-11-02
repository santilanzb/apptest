import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/product_repository.dart';
import '../../data/models/product_model.dart';
import '../../data/services/supabase_service.dart';

// Product Repository Provider
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final supabase = ref.watch(supabaseServiceProvider);
  return ProductRepository(supabase);
});

// Products List Provider
final productsProvider = FutureProvider<List<ProductModel>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getProducts();
});

// Single Product Provider
final productByIdProvider = FutureProvider.family<ProductModel?, String>(
  (ref, productId) async {
    final repository = ref.watch(productRepositoryProvider);
    return repository.getProductById(productId);
  },
);

// Search Products Provider
final searchProductsProvider = FutureProvider.family<List<ProductModel>, String>(
  (ref, query) async {
    final repository = ref.watch(productRepositoryProvider);
    if (query.isEmpty) {
      return repository.getProducts();
    }
    return repository.searchProducts(query);
  },
);

// Products by Category Provider
final productsByCategoryProvider = FutureProvider.family<List<ProductModel>, String>(
  (ref, category) async {
    final repository = ref.watch(productRepositoryProvider);
    return repository.getProductsByCategory(category);
  },
);
