
> Problem: [662. 二叉树最大宽度](https://leetcode.cn/problems/maximum-width-of-binary-tree/description/)

[TOC]

# 思路

> 讲述看到这一题的思路

# 解题方法

> 描述你的解题方法

# 复杂度

时间复杂度:
> 添加时间复杂度, 示例： $O(n)$

空间复杂度:
> 添加空间复杂度, 示例： $O(n)$



# Code
```C++ []
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    int widthOfBinaryTree(TreeNode* root) {
        if (root == nullptr) return 0;

        int result = 0;
        queue<pair<TreeNode*, unsigned long long>> q;
        q.push(make_pair(root, 1)); // root node index is 1
        
        while (!q.empty())
        {
            int count = q.size();
            unsigned long long left = q.front().second, right = left; // initialize left & right index
            for(int i = 0; i < count; ++i)
            {
                auto node = q.front().first;
                right = q.front().second; // update right index
                q.pop();
                if (node->left) 
                    q.push(make_pair(node->left, right * 2));
                if (node->right) 
                    q.push(make_pair(node->right, right * 2 + 1));
            }
            result = max(static_cast<int>(right - left + 1), result); // update result
        }
        return result;
    }
};
```
  
