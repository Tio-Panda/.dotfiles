local ls = require('luasnip')
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("cpp", {
    s("!cp", fmt([[ 
        #include <bits/stdc++.h>
        using namespace std;
        typedef long long ll;

        int main(){{
            int n; cin >> n;

            return 0;
        }}
        ]], {}, {delimeters='[]'})
    )
})
