using System.Collections.Generic;
using System.Data.Entity;

namespace MyWebFormsProject.Models
{
    public class ProductDatabaseInitializer : DropCreateDatabaseIfModelChanges<ProductContext>
    {
       
        protected override void Seed(ProductContext context)
        {
            GetCategories().ForEach(c => context.Categories.Add(c));
            GetProducts().ForEach(p => context.Products.Add(p));
        }

        private static List<Category> GetCategories()
        {
            var categories = new List<Category> {
                new Category
                {
                    CategoryID = 1,
                    CategoryName = "Favorite Bread"
                },
                new Category
                {
                    CategoryID = 2,
                    CategoryName = "Newest Bread"
                },
            };

            return categories;
        }

        private static List<Product> GetProducts()
        {
            var products = new List<Product> {
                new Product
                {
                    ProductID = 1,
                    ProductName = "Honey Whole Wheat",
                    Description = "Our signature and most popular bread is a perfect blend of five pure ingredients – freshly ground, flavor-rich, 100% whole wheat flour, pure honey, filtered water, salt, and yeast.",
                    ImagePath="Honey-Whole-Wheat.jpg",
                    UnitPrice = 5.50,
                    CategoryID = 1
               },
                new Product
                {
                    ProductID = 2,
                    ProductName = "Dakota",
                    Description = "Sunflower, pumpkin, and sesame seeds are generously kneaded into our honey whole wheat dough for a crunchy, hearty, and flavorful bread.",
                    ImagePath="Dakota.jpg",
                    UnitPrice = 4.95,
                     CategoryID = 1
               },
                new Product
                {
                    ProductID = 3,
                    ProductName = "Cinnamon Chip",
                    Description = "Enjoy the sweet goodness of cinnamon chips in every bite. Flour, cinnamon chips, honey, and ground cinnamon. Makes a heavenly French toast.",
                    ImagePath="Cinnamon-Chip.jpg",
                    UnitPrice = 3.99,
                    CategoryID = 1
                },
                new Product
                {
                    ProductID = 4,
                    ProductName = "High 5 Fiber",
                    Description = "Freshly ground 100% whole wheat flour, honey, flax seeds, oat bran, millet, sunflower seeds, and wheat bran.",
                    ImagePath="High-5-Fiber.jpg",
                    UnitPrice = 4.95,
                    CategoryID = 1
                },
                new Product
                {
                    ProductID = 5,
                    ProductName = "Hummus Bread",
                    Description = "Hummus as bread! This awesome bread is made with only fresh, simple ingredients: chickpeas, freshly ground 100% whole wheat flour, sesame seeds, garlic, cumin, cayenne pepper, olive oil, honey, salt, yeast, and water! It makes an incredible sandwich bread, or try it toasted with fresh avocado.",
                    ImagePath="Hummus-Bread.jpg",
                    UnitPrice = 4.95,
                    CategoryID = 2
                },
                new Product
                {
                    ProductID = 6,
                    ProductName = "Superfood Bread",
                    Description = "A 100% whole grain bread made with only super simple, nutritious ingredients: quinoa, freshly ground whole wheat flour, flax, oat bran, hemp seeds, extra virgin olive oil, honey, salt, yeast, and water.",
                    ImagePath="Superfood-Bread.jpg",
                    UnitPrice = 5.00,
                    CategoryID = 2
                },
                new Product
                {
                    ProductID = 7,
                    ProductName = "Anadama",
                    Description = "A tantalizing combination of buttermilk-soaked coarse cornmeal, whole wheat and white flours, honey, and molasses. Soft and fluffy with the sweet crunch of corn. It is perfect sandwich bread and makes a wonderful toast!",
                    ImagePath="Anadama.jpg",
                    UnitPrice = 4.95,
                    CategoryID = 2
                }               
            };

            return products;
        }
    }
}
