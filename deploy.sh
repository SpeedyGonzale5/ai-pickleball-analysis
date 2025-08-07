#!/bin/bash

# AI Sports Analysis Tool - GitHub Deployment Script
# This script helps you deploy your project to a new GitHub repository

echo "🚀 AI Pickleball Analysis Tool - GitHub Deployment"
echo "==============================================="

# Check if we're in a git repository
if [ -d ".git" ]; then
    echo "⚠️  Existing git repository detected."
    read -p "Do you want to start fresh? This will remove git history (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "🗑️  Removing existing git history..."
        rm -rf .git
    fi
fi

# Initialize git if needed
if [ ! -d ".git" ]; then
    echo "📦 Initializing new git repository..."
    git init
fi

# Get repository name
read -p "Enter your new repository name (e.g., ai-sports-analysis): " REPO_NAME
if [ -z "$REPO_NAME" ]; then
    REPO_NAME="ai-pickleball-analysis"
fi

# Get GitHub username
read -p "Enter your GitHub username: " GITHUB_USER
if [ -z "$GITHUB_USER" ]; then
    echo "❌ GitHub username is required"
    exit 1
fi

# Check for large files
echo "🔍 Checking for large files..."
LARGE_FILES=$(find . -size +50M -type f -not -path "./.git/*" 2>/dev/null)
if [ ! -z "$LARGE_FILES" ]; then
    echo "⚠️  Large files detected:"
    echo "$LARGE_FILES"
    echo "These should be added to .gitignore or removed before pushing."
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Add all files
echo "📝 Adding files to git..."
git add .

# Check if there are any changes to commit
if git diff --staged --quiet; then
    echo "ℹ️  No changes to commit"
else
    # Make initial commit
    echo "💾 Making initial commit..."
    git commit -m "Initial commit: AI Sports Analysis Tool

- Added comprehensive README with installation instructions
- Created requirements.txt with dependencies
- Added .gitignore for video files and outputs
- Included setup.py for automated installation
- Added deployment documentation
- Created sample analysis data
- Added GitHub Actions CI/CD workflow"
fi

# Set main branch
git branch -M main

# Add remote origin
REPO_URL="https://github.com/$GITHUB_USER/$REPO_NAME.git"
echo "🌐 Adding remote origin: $REPO_URL"

# Remove existing origin if it exists
git remote remove origin 2>/dev/null || true
git remote add origin "$REPO_URL"

echo ""
echo "✅ Local repository setup complete!"
echo ""
echo "Next steps:"
echo "1. Create repository on GitHub:"
echo "   - Go to https://github.com/new"
echo "   - Repository name: $REPO_NAME"
echo "   - Description: AI-powered sports analysis tool with real-time feedback"
echo "   - Make it Public"
echo "   - Don't initialize with README (you already have one)"
echo ""
echo "2. Push to GitHub:"
echo "   git push -u origin main"
echo ""
echo "3. Optional - Create first release:"
echo "   git tag -a v1.0.0 -m 'Initial release'"
echo "   git push origin v1.0.0"
echo ""
echo "🎉 Happy coding!"
