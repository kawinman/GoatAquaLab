#!/bin/bash

# Script to fix unclosed meta tags in all HTML files
echo "Fixing unclosed meta tags in all HTML files..."

# Find all HTML files and fix unclosed meta tags
find . -name "*.html" -type f | while read file; do
    echo "Processing: $file"
    
    # Fix meta tags that don't end with />
    sed -i '' 's/<meta charset="UTF-8">/<meta charset="UTF-8" \/>/g' "$file"
    sed -i '' 's/<meta name="viewport" content="[^"]*">/<meta name="viewport" content="&" \/>/g' "$file"
    sed -i '' 's/<meta name="description" content="[^"]*">/<meta name="description" content="&" \/>/g' "$file"
    sed -i '' 's/<meta name="keywords" content="[^"]*">/<meta name="keywords" content="&" \/>/g' "$file"
    sed -i '' 's/<meta name="msapplication-TileColor" content="[^"]*">/<meta name="msapplication-TileColor" content="&" \/>/g' "$file"
    sed -i '' 's/<meta name="theme-color" content="[^"]*">/<meta name="theme-color" content="&" \/>/g' "$file"
    sed -i '' 's/<meta name="twitter:card" content="[^"]*">/<meta name="twitter:card" content="&" \/>/g' "$file"
    sed -i '' 's/<meta name="twitter:title" content="[^"]*">/<meta name="twitter:title" content="&" \/>/g' "$file"
    sed -i '' 's/<meta name="twitter:description" content="[^"]*">/<meta name="twitter:description" content="&" \/>/g' "$file"
    sed -i '' 's/<meta name="twitter:image" content="[^"]*">/<meta name="twitter:image" content="&" \/>/g' "$file"
done

echo "Meta tag fixes completed!"
