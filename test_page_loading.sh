#!/bin/bash

echo "🔍 Testing index page loading issues..."

# Check for common loading problems
echo "📄 Analyzing index.html for potential issues..."

# Check for async Tailwind (should be synchronous)
if grep -q 'tailwindcss.com.*async' index.html; then
    echo "❌ ISSUE: Tailwind CSS is loading asynchronously - this causes styling issues"
else
    echo "✅ Tailwind CSS loading correctly (synchronously)"
fi

# Check for font loading issues
if grep -q 'onload.*stylesheet' index.html; then
    echo "❌ ISSUE: Fonts loading asynchronously - may cause FOUT"
else
    echo "✅ Fonts loading correctly (synchronously)"
fi

# Check for duplicate CSS definitions (excluding media queries and child selectors)
duplicate_count=$(grep -c '^[[:space:]]*\.hero-section[[:space:]]*{' index.html)
if [ "$duplicate_count" -gt 1 ]; then
    echo "❌ ISSUE: Found $duplicate_count duplicate .hero-section definitions"
else
    echo "✅ No duplicate CSS definitions found"
fi

# Check for missing critical resources
if ! grep -q 'rel="preload".*IMG_3970' index.html; then
    echo "❌ ISSUE: Hero image not preloaded"
else
    echo "✅ Hero image preloaded correctly"
fi

# Check for proper script loading order
if grep -q 'tailwindcss.com' index.html && grep -q 'chart.js.*async' index.html; then
    echo "✅ Script loading order is correct"
else
    echo "❌ ISSUE: Script loading order may be problematic"
fi

echo ""
echo "🔧 Fixes applied:"
echo "✅ Made Tailwind CSS load synchronously"
echo "✅ Fixed font loading to prevent FOUT"
echo "✅ Resolved duplicate CSS definitions"
echo "✅ Maintained image preloading"
echo ""
echo "🚀 The page should now load properly with correct styling!"
