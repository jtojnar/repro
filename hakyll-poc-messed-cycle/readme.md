When I try to to build my site with Hakyll 4.15.1.0, it fails as follows:

```ShellSession
$ cabal run -- site rebuild -v
Removing _site...
Removing _cache...
Removing _cache/tmp...
Initialising...
  Creating store...
  Creating provider...
  Running rules...
Checking for out-of-date items
  [DEBUG] content/cs/news/2021-11-22-website-launch.md is out-of-date because it is new
  [DEBUG] content/cs/news/index.html is out-of-date because it is new
  [DEBUG] content/en/news/2021-11-22-website-launch.md is out-of-date because it is new
  [DEBUG] content/en/news/index.html is out-of-date because it is new
  [DEBUG] templates/layout.html is out-of-date because it is new
  [DEBUG] templates/post.html is out-of-date because it is new
  [DEBUG] templates/posts.html is out-of-date because it is new
  [DEBUG] content/cs/news/2021-11-22-website-launch.md (menu) is out-of-date because it is new
  [DEBUG] content/en/news/2021-11-22-website-launch.md (menu) is out-of-date because it is new
Compiling
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Storing snapshot: content
  [DEBUG] Processing content/cs/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (And (Glob [Literal "content/",Capture,Literal "/news/",Capture,Literal ".md"]) (And (Version Nothing) (Glob [Literal "content/cs/",CaptureMany,Literal ""]))) (fromList [content/cs/news/2021-11-22-website-launch.md])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Compiler requirement found for: content/cs/news/index.html: content/cs/news/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/en/news/2021-11-22-website-launch.md
  [DEBUG] Storing snapshot: content
  [DEBUG] Processing content/en/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (And (Glob [Literal "content/",Capture,Literal "/news/",Capture,Literal ".md"]) (And (Version Nothing) (Glob [Literal "content/en/",CaptureMany,Literal ""]))) (fromList [content/en/news/2021-11-22-website-launch.md])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/news/2021-11-22-website-launch.md
  [DEBUG] Compiler requirement found for: content/en/news/index.html: content/en/news/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing templates/layout.html
  updated templates/layout.html
  [DEBUG] Processing templates/post.html
  updated templates/post.html
  [DEBUG] Processing templates/posts.html
  updated templates/posts.html
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md (menu)
  updated content/cs/news/2021-11-22-website-launch.md (menu)
  [DEBUG] Processing content/en/news/2021-11-22-website-launch.md (menu)
  updated content/en/news/2021-11-22-website-launch.md (menu)
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/post.html
  [DEBUG] Compiler requirement found for: content/cs/news/2021-11-22-website-launch.md: templates/post.html (snapshot _final)
  [DEBUG] Processing content/cs/news/index.html
  [DEBUG] Compiler requirement found for: content/cs/news/index.html: content/cs/news/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/en/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/post.html
  [DEBUG] Compiler requirement found for: content/en/news/2021-11-22-website-launch.md: templates/post.html (snapshot _final)
  [DEBUG] Processing content/en/news/index.html
  [DEBUG] Compiler requirement found for: content/en/news/index.html: content/en/news/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/layout.html
  [DEBUG] Compiler requirement found for: content/cs/news/2021-11-22-website-launch.md: templates/layout.html (snapshot _final)
  [DEBUG] Processing content/cs/news/index.html
  [DEBUG] Compiler requirement found for: content/cs/news/index.html: content/cs/news/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/en/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/layout.html
  [DEBUG] Compiler requirement found for: content/en/news/2021-11-22-website-launch.md: templates/layout.html (snapshot _final)
  [DEBUG] Processing content/en/news/index.html
  [DEBUG] Compiler requirement found for: content/en/news/index.html: content/en/news/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/cs/news/2021-11-22-website-launch.md (menu)])) (fromList [content/cs/news/2021-11-22-website-launch.md (menu)])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/news/2021-11-22-website-launch.md (menu)
  [DEBUG] Compiler requirement found for: content/cs/news/2021-11-22-website-launch.md: content/cs/news/2021-11-22-website-launch.md (menu) (snapshot _final)
  [DEBUG] Processing content/cs/news/index.html
  [DEBUG] Compiler requirement found for: content/cs/news/index.html: content/cs/news/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/en/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/cs/news/2021-11-22-website-launch.md (menu)])) (fromList [content/cs/news/2021-11-22-website-launch.md (menu)])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/news/2021-11-22-website-launch.md (menu)
  [DEBUG] Compiler requirement found for: content/en/news/2021-11-22-website-launch.md: content/cs/news/2021-11-22-website-launch.md (menu) (snapshot _final)
  [DEBUG] Processing content/en/news/index.html
  [DEBUG] Compiler requirement found for: content/en/news/index.html: content/en/news/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/en/news/2021-11-22-website-launch.md (menu)])) (fromList [content/en/news/2021-11-22-website-launch.md (menu)])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/news/2021-11-22-website-launch.md (menu)
  [DEBUG] Compiler requirement found for: content/cs/news/2021-11-22-website-launch.md: content/en/news/2021-11-22-website-launch.md (menu) (snapshot _final)
  [DEBUG] Processing content/cs/news/index.html
  [DEBUG] Compiler requirement found for: content/cs/news/index.html: content/cs/news/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/en/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/en/news/2021-11-22-website-launch.md (menu)])) (fromList [content/en/news/2021-11-22-website-launch.md (menu)])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/news/2021-11-22-website-launch.md (menu)
  [DEBUG] Compiler requirement found for: content/en/news/2021-11-22-website-launch.md: content/en/news/2021-11-22-website-launch.md (menu) (snapshot _final)
  [DEBUG] Processing content/en/news/index.html
  [DEBUG] Compiler requirement found for: content/en/news/index.html: content/en/news/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/news/2021-11-22-website-launch.md
  updated content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Routed to _site/cs/news/2021-11-22-website-launch.html
  [DEBUG] Processing content/cs/news/index.html
  [DEBUG] Compiler requirement found for: content/cs/news/index.html: content/cs/news/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/en/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/news/2021-11-22-website-launch.md
  updated content/en/news/2021-11-22-website-launch.md
  [DEBUG] Routed to _site/en/news/2021-11-22-website-launch.html
  [DEBUG] Processing content/en/news/index.html
  [DEBUG] Compiler requirement found for: content/en/news/index.html: content/en/news/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/cs/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/posts.html
  [DEBUG] Compiler requirement found for: content/cs/news/index.html: templates/posts.html (snapshot _final)
  [DEBUG] Processing content/en/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/posts.html
  [DEBUG] Compiler requirement found for: content/en/news/index.html: templates/posts.html (snapshot _final)
  [DEBUG] Processing content/cs/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/layout.html
  [DEBUG] Compiler requirement found for: content/cs/news/index.html: templates/layout.html (snapshot _final)
  [DEBUG] Processing content/en/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/layout.html
  [DEBUG] Compiler requirement found for: content/en/news/index.html: templates/layout.html (snapshot _final)
  [DEBUG] Processing content/cs/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/cs/news/index.html (menu)])) (fromList [])
  [DEBUG] Processing content/en/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/cs/news/index.html (menu)])) (fromList [])
  [ERROR] Hakyll.Core.Runtime.pickAndChase: Dependency cycle detected: content/cs/news/index.html depends on [(content/cs/news/2021-11-22-website-launch.md,"_final")], content/en/news/index.html depends on [(content/en/news/2021-11-22-website-launch.md,"_final")]
```

It worked with hakyll 4.14.0.0

```ShellSession
$ cabal run -- site rebuild -v
Removing _site...
Removing _cache...
Removing _cache/tmp...
Initialising...
  Creating store...
  Creating provider...
  Running rules...
Checking for out-of-date items
  [DEBUG] content/cs/news/2021-11-22-website-launch.md is out-of-date because it is new
  [DEBUG] content/cs/news/index.html is out-of-date because it is new
  [DEBUG] content/en/news/2021-11-22-website-launch.md is out-of-date because it is new
  [DEBUG] content/en/news/index.html is out-of-date because it is new
  [DEBUG] templates/layout.html is out-of-date because it is new
  [DEBUG] templates/post.html is out-of-date because it is new
  [DEBUG] templates/posts.html is out-of-date because it is new
  [DEBUG] content/cs/news/2021-11-22-website-launch.md (menu) is out-of-date because it is new
  [DEBUG] content/en/news/2021-11-22-website-launch.md (menu) is out-of-date because it is new
Compiling
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Storing snapshot: content
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/post.html
  [DEBUG] Require templates/post.html (snapshot _final): chasing
  [DEBUG] Processing templates/post.html
  updated templates/post.html
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Require templates/post.html (snapshot _final): OK
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/layout.html
  [DEBUG] Require templates/layout.html (snapshot _final): chasing
  [DEBUG] Processing templates/layout.html
  updated templates/layout.html
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Require templates/layout.html (snapshot _final): OK
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/cs/news/2021-11-22-website-launch.md (menu)])) (fromList [content/cs/news/2021-11-22-website-launch.md (menu)])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/news/2021-11-22-website-launch.md (menu)
  [DEBUG] Require content/cs/news/2021-11-22-website-launch.md (menu) (snapshot _final): chasing
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md (menu)
  updated content/cs/news/2021-11-22-website-launch.md (menu)
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Require content/cs/news/2021-11-22-website-launch.md (menu) (snapshot _final): OK
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/en/news/2021-11-22-website-launch.md (menu)])) (fromList [content/en/news/2021-11-22-website-launch.md (menu)])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/news/2021-11-22-website-launch.md (menu)
  [DEBUG] Require content/en/news/2021-11-22-website-launch.md (menu) (snapshot _final): chasing
  [DEBUG] Processing content/en/news/2021-11-22-website-launch.md (menu)
  updated content/en/news/2021-11-22-website-launch.md (menu)
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Require content/en/news/2021-11-22-website-launch.md (menu) (snapshot _final): OK
  [DEBUG] Processing content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/news/2021-11-22-website-launch.md
  updated content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Routed to _site/cs/news/2021-11-22-website-launch.html
  [DEBUG] Processing content/cs/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (And (Glob [Literal "content/",Capture,Literal "/news/",Capture,Literal ".md"]) (And (Version Nothing) (Glob [Literal "content/cs/",CaptureMany,Literal ""]))) (fromList [content/cs/news/2021-11-22-website-launch.md])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Require content/cs/news/2021-11-22-website-launch.md (snapshot _final): OK
  [DEBUG] Processing content/cs/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/posts.html
  [DEBUG] Require templates/posts.html (snapshot _final): chasing
  [DEBUG] Processing templates/posts.html
  updated templates/posts.html
  [DEBUG] Processing content/cs/news/index.html
  [DEBUG] Require templates/posts.html (snapshot _final): OK
  [DEBUG] Processing content/cs/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/layout.html
  [DEBUG] Require templates/layout.html (snapshot _final): OK
  [DEBUG] Processing content/cs/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/cs/news/index.html (menu)])) (fromList [])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/en/news/index.html (menu)])) (fromList [])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/news/index.html
  updated content/cs/news/index.html
  [DEBUG] Routed to _site/cs/news/index.html
  [DEBUG] Processing content/en/news/2021-11-22-website-launch.md
  [DEBUG] Storing snapshot: content
  [DEBUG] Processing content/en/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/post.html
  [DEBUG] Require templates/post.html (snapshot _final): OK
  [DEBUG] Processing content/en/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/layout.html
  [DEBUG] Require templates/layout.html (snapshot _final): OK
  [DEBUG] Processing content/en/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/cs/news/2021-11-22-website-launch.md (menu)])) (fromList [content/cs/news/2021-11-22-website-launch.md (menu)])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/news/2021-11-22-website-launch.md (menu)
  [DEBUG] Require content/cs/news/2021-11-22-website-launch.md (menu) (snapshot _final): OK
  [DEBUG] Processing content/en/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/en/news/2021-11-22-website-launch.md (menu)])) (fromList [content/en/news/2021-11-22-website-launch.md (menu)])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/news/2021-11-22-website-launch.md (menu)
  [DEBUG] Require content/en/news/2021-11-22-website-launch.md (menu) (snapshot _final): OK
  [DEBUG] Processing content/en/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/news/2021-11-22-website-launch.md
  updated content/en/news/2021-11-22-website-launch.md
  [DEBUG] Routed to _site/en/news/2021-11-22-website-launch.html
  [DEBUG] Processing content/en/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (And (Glob [Literal "content/",Capture,Literal "/news/",Capture,Literal ".md"]) (And (Version Nothing) (Glob [Literal "content/en/",CaptureMany,Literal ""]))) (fromList [content/en/news/2021-11-22-website-launch.md])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/news/2021-11-22-website-launch.md
  [DEBUG] Require content/en/news/2021-11-22-website-launch.md (snapshot _final): OK
  [DEBUG] Processing content/en/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/news/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/posts.html
  [DEBUG] Require templates/posts.html (snapshot _final): OK
  [DEBUG] Processing content/en/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/layout.html
  [DEBUG] Require templates/layout.html (snapshot _final): OK
  [DEBUG] Processing content/en/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/news/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/cs/news/index.html (menu)])) (fromList [])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/en/news/index.html (menu)])) (fromList [])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/news/index.html
  updated content/en/news/index.html
  [DEBUG] Routed to _site/en/news/index.html
Success
  [DEBUG] Removing tmp directory...
```

There is no cycle, according to the graph generated by https://github.com/jaspervdj/hakyll/pull/906:

```gv
digraph {
    subgraph "cluster_content/cs/news/2021-11-22-website-launch.md" {
        "content/cs/news/2021-11-22-website-launch.md";
        "content/cs/news/2021-11-22-website-launch.md (menu)";
    }
    subgraph "cluster_content/cs/news/index.html" {
        "content/cs/news/index.html";
    }
    subgraph "cluster_content/en/news/2021-11-22-website-launch.md" {
        "content/en/news/2021-11-22-website-launch.md";
        "content/en/news/2021-11-22-website-launch.md (menu)";
    }
    subgraph "cluster_content/en/news/index.html" {
        "content/en/news/index.html";
    }
    subgraph "cluster_templates/layout.html" {
        "templates/layout.html";
    }
    subgraph "cluster_templates/post.html" {
        "templates/post.html";
    }
    subgraph "cluster_templates/posts.html" {
        "templates/posts.html";
    }
    "content/cs/news/2021-11-22-website-launch.md" -> "templates/layout.html" [label=_final];
    "content/cs/news/2021-11-22-website-launch.md" -> "templates/post.html" [label=_final];
    "content/cs/news/2021-11-22-website-launch.md" -> "content/cs/news/2021-11-22-website-launch.md (menu)" [label=_final];
    "content/cs/news/2021-11-22-website-launch.md" -> "content/en/news/2021-11-22-website-launch.md (menu)" [label=_final];
    "content/cs/news/index.html" -> "content/cs/news/2021-11-22-website-launch.md" [label=_final];
    "content/cs/news/index.html" -> "templates/layout.html" [label=_final];
    "content/cs/news/index.html" -> "templates/posts.html" [label=_final];
    "content/en/news/2021-11-22-website-launch.md" -> "templates/layout.html" [label=_final];
    "content/en/news/2021-11-22-website-launch.md" -> "templates/post.html" [label=_final];
    "content/en/news/2021-11-22-website-launch.md" -> "content/cs/news/2021-11-22-website-launch.md (menu)" [label=_final];
    "content/en/news/2021-11-22-website-launch.md" -> "content/en/news/2021-11-22-website-launch.md (menu)" [label=_final];
    "content/en/news/index.html" -> "content/en/news/2021-11-22-website-launch.md" [label=_final];
    "content/en/news/index.html" -> "templates/layout.html" [label=_final];
    "content/en/news/index.html" -> "templates/posts.html" [label=_final];
}
```

I recommend [`xdot`](https://github.com/jrfonseca/xdot.py) for viewing the graphs. [Edotor](https://edotor.net/) works in the web browser but does not support highlighting adjacent edges. Passing `-f fdp` to `xdot` might lay out the graph slightly more manageably.
