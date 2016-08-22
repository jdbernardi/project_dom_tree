finding h# tags...<h[0-9]>(.*?)</h[0-9]>

Example 1: Greedy:
Regex: <h[0-9]>.*</h[0-9]>
Input: <h3>My Title</h3>
<h[0-9]> matches: <h3>
.* matches: My Title</h3>

Example 2: Non-Greedy:
Regex: <h[0-9]>.*?</h[0-9]>
Input: <h3>My Title</h3>
<h[0-9]> matches: <h3>
.*? matches: My Title
</h[0-9]> matches: </h3>

greedy gives the longest match

{START}.*?{END} LAZY 