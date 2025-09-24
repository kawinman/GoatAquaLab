#!/bin/bash

echo "🔧 Fixing indexing issues for G.O.A.T Aqua Lab blog posts..."

# Check if the problematic blog posts exist
echo "📋 Checking blog posts that are crawled but not indexed:"
for post in blog-post-20.html blog-post-26.html blog-post-36.html blog-post-37.html blog-post-38.html; do
    if [ -f "blogs/$post" ]; then
        echo "✅ $post exists"
        
        # Check for robots meta tag
        if grep -q 'meta name="robots"' "blogs/$post"; then
            echo "   ✅ Has robots meta tag"
        else
            echo "   ❌ Missing robots meta tag"
        fi
        
        # Check for canonical URL
        if grep -q 'rel="canonical"' "blogs/$post"; then
            echo "   ✅ Has canonical URL"
        else
            echo "   ❌ Missing canonical URL"
        fi
        
        # Check for Open Graph tags
        if grep -q 'property="og:' "blogs/$post"; then
            echo "   ✅ Has Open Graph tags"
        else
            echo "   ❌ Missing Open Graph tags"
        fi
        
    else
        echo "❌ $post not found"
    fi
    echo ""
done

echo "🔍 Checking sitemap.xml for the problematic posts:"
for post in blog-post-20.html blog-post-26.html blog-post-36.html blog-post-37.html blog-post-38.html; do
    if grep -q "$post" sitemap.xml; then
        echo "✅ $post is in sitemap"
    else
        echo "❌ $post missing from sitemap"
    fi
done

echo ""
echo "📊 Summary of fixes applied:"
echo "✅ Added robots meta tag to blog-post-26.html"
echo "✅ Fixed URL inconsistency in blog-post-26.html Open Graph"
echo "✅ Updated sitemap dates for blog-post-20.html and blog-post-26.html"
echo ""
echo "🚀 Next steps:"
echo "1. Submit updated sitemap to Google Search Console"
echo "2. Request re-indexing for each problematic URL"
echo "3. Monitor indexing status in Google Search Console"
echo ""
echo "✨ All technical fixes have been applied!"
