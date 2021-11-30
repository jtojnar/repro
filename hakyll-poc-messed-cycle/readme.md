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
  [DEBUG] content/cs/2021-11-22-website-launch.md is out-of-date because it is new
  [DEBUG] content/cs/index.html is out-of-date because it is new
  [DEBUG] content/en/2021-11-22-website-launch.md is out-of-date because it is new
  [DEBUG] content/en/index.html is out-of-date because it is new
  [DEBUG] templates/layout.html is out-of-date because it is new
  [DEBUG] templates/posts.html is out-of-date because it is new
  [DEBUG] content/cs/2021-11-22-website-launch.md (destination) is out-of-date because it is new
  [DEBUG] content/en/2021-11-22-website-launch.md (destination) is out-of-date because it is new
Compiling
  [DEBUG] Processing content/cs/2021-11-22-website-launch.md
  [DEBUG] Storing snapshot: content
  [DEBUG] Processing content/cs/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (And (Glob [Literal "content/",Capture,Literal "/",Capture,Literal ".md"]) (And (Version Nothing) (Glob [Literal "content/cs/",CaptureMany,Literal ""]))) (fromList [content/cs/2021-11-22-website-launch.md])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/2021-11-22-website-launch.md
  [DEBUG] Compiler requirement found for: content/cs/index.html: content/cs/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/en/2021-11-22-website-launch.md
  [DEBUG] Storing snapshot: content
  [DEBUG] Processing content/en/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (And (Glob [Literal "content/",Capture,Literal "/",Capture,Literal ".md"]) (And (Version Nothing) (Glob [Literal "content/en/",CaptureMany,Literal ""]))) (fromList [content/en/2021-11-22-website-launch.md])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/2021-11-22-website-launch.md
  [DEBUG] Compiler requirement found for: content/en/index.html: content/en/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing templates/layout.html
  updated templates/layout.html
  [DEBUG] Processing templates/posts.html
  updated templates/posts.html
  [DEBUG] Processing content/cs/2021-11-22-website-launch.md (destination)
  updated content/cs/2021-11-22-website-launch.md (destination)
  [DEBUG] Processing content/en/2021-11-22-website-launch.md (destination)
  updated content/en/2021-11-22-website-launch.md (destination)
  [DEBUG] Processing content/cs/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/layout.html
  [DEBUG] Compiler requirement found for: content/cs/2021-11-22-website-launch.md: templates/layout.html (snapshot _final)
  [DEBUG] Processing content/cs/index.html
  [DEBUG] Compiler requirement found for: content/cs/index.html: content/cs/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/en/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/layout.html
  [DEBUG] Compiler requirement found for: content/en/2021-11-22-website-launch.md: templates/layout.html (snapshot _final)
  [DEBUG] Processing content/en/index.html
  [DEBUG] Compiler requirement found for: content/en/index.html: content/en/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/cs/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/cs/2021-11-22-website-launch.md (destination)])) (fromList [content/cs/2021-11-22-website-launch.md (destination)])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/2021-11-22-website-launch.md (destination)
  [DEBUG] Compiler requirement found for: content/cs/2021-11-22-website-launch.md: content/cs/2021-11-22-website-launch.md (destination) (snapshot _final)
  [DEBUG] Processing content/cs/index.html
  [DEBUG] Compiler requirement found for: content/cs/index.html: content/cs/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/en/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/cs/2021-11-22-website-launch.md (destination)])) (fromList [content/cs/2021-11-22-website-launch.md (destination)])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/2021-11-22-website-launch.md (destination)
  [DEBUG] Compiler requirement found for: content/en/2021-11-22-website-launch.md: content/cs/2021-11-22-website-launch.md (destination) (snapshot _final)
  [DEBUG] Processing content/en/index.html
  [DEBUG] Compiler requirement found for: content/en/index.html: content/en/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/cs/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/en/2021-11-22-website-launch.md (destination)])) (fromList [content/en/2021-11-22-website-launch.md (destination)])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/2021-11-22-website-launch.md (destination)
  [DEBUG] Compiler requirement found for: content/cs/2021-11-22-website-launch.md: content/en/2021-11-22-website-launch.md (destination) (snapshot _final)
  [DEBUG] Processing content/cs/index.html
  [DEBUG] Compiler requirement found for: content/cs/index.html: content/cs/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/en/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/en/2021-11-22-website-launch.md (destination)])) (fromList [content/en/2021-11-22-website-launch.md (destination)])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/2021-11-22-website-launch.md (destination)
  [DEBUG] Compiler requirement found for: content/en/2021-11-22-website-launch.md: content/en/2021-11-22-website-launch.md (destination) (snapshot _final)
  [DEBUG] Processing content/en/index.html
  [DEBUG] Compiler requirement found for: content/en/index.html: content/en/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/cs/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/2021-11-22-website-launch.md
  updated content/cs/2021-11-22-website-launch.md
  [DEBUG] Routed to _site/cs/2021-11-22-website-launch.html
  [DEBUG] Processing content/cs/index.html
  [DEBUG] Compiler requirement found for: content/cs/index.html: content/cs/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/en/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/2021-11-22-website-launch.md
  updated content/en/2021-11-22-website-launch.md
  [DEBUG] Routed to _site/en/2021-11-22-website-launch.html
  [DEBUG] Processing content/en/index.html
  [DEBUG] Compiler requirement found for: content/en/index.html: content/en/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/cs/index.html
  [DEBUG] Processing content/en/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/posts.html
  [DEBUG] Compiler requirement found for: content/cs/index.html: templates/posts.html (snapshot _final)
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/posts.html
  [DEBUG] Compiler requirement found for: content/en/index.html: templates/posts.html (snapshot _final)
  [DEBUG] Processing content/cs/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/layout.html
  [DEBUG] Compiler requirement found for: content/cs/index.html: templates/layout.html (snapshot _final)
  [DEBUG] Processing content/en/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/layout.html
  [DEBUG] Compiler requirement found for: content/en/index.html: templates/layout.html (snapshot _final)
  [DEBUG] Processing content/cs/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/cs/index.html (destination)])) (fromList [])
  [DEBUG] Processing content/en/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/cs/index.html (destination)])) (fromList [])
  [ERROR] Hakyll.Core.Runtime.pickAndChase: Dependency cycle detected: content/cs/index.html depends on [(content/cs/2021-11-22-website-launch.md,"_final")], content/en/index.html depends on [(content/en/2021-11-22-website-launch.md,"_final")]
```

It worked with hakyll 4.14.1.0

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
  [DEBUG] content/cs/2021-11-22-website-launch.md is out-of-date because it is new
  [DEBUG] content/cs/index.html is out-of-date because it is new
  [DEBUG] content/en/2021-11-22-website-launch.md is out-of-date because it is new
  [DEBUG] content/en/index.html is out-of-date because it is new
  [DEBUG] templates/layout.html is out-of-date because it is new
  [DEBUG] templates/posts.html is out-of-date because it is new
  [DEBUG] content/cs/2021-11-22-website-launch.md (destination) is out-of-date because it is new
  [DEBUG] content/en/2021-11-22-website-launch.md (destination) is out-of-date because it is new
Compiling
  [DEBUG] Processing content/cs/2021-11-22-website-launch.md
  [DEBUG] Storing snapshot: content
  [DEBUG] Processing content/cs/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (And (Glob [Literal "content/",Capture,Literal "/",Capture,Literal ".md"]) (And (Version Nothing) (Glob [Literal "content/cs/",CaptureMany,Literal ""]))) (fromList [content/cs/2021-11-22-website-launch.md])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/2021-11-22-website-launch.md
  [DEBUG] Compiler requirement found for: content/cs/index.html, requirement: content/cs/2021-11-22-website-launch.md
  [DEBUG] Require content/cs/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/en/2021-11-22-website-launch.md
  [DEBUG] Storing snapshot: content
  [DEBUG] Processing content/en/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (And (Glob [Literal "content/",Capture,Literal "/",Capture,Literal ".md"]) (And (Version Nothing) (Glob [Literal "content/en/",CaptureMany,Literal ""]))) (fromList [content/en/2021-11-22-website-launch.md])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/2021-11-22-website-launch.md
  [DEBUG] Compiler requirement found for: content/en/index.html, requirement: content/en/2021-11-22-website-launch.md
  [DEBUG] Require content/en/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing templates/layout.html
  updated templates/layout.html
  [DEBUG] Processing templates/posts.html
  updated templates/posts.html
  [DEBUG] Processing content/cs/2021-11-22-website-launch.md (destination)
  updated content/cs/2021-11-22-website-launch.md (destination)
  [DEBUG] Processing content/en/2021-11-22-website-launch.md (destination)
  updated content/en/2021-11-22-website-launch.md (destination)
  [DEBUG] Processing content/cs/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/layout.html
  [DEBUG] Compiler requirement found for: content/cs/2021-11-22-website-launch.md, requirement: templates/layout.html
  [DEBUG] Require templates/layout.html (snapshot _final)
  [DEBUG] Processing content/cs/index.html
  [DEBUG] Compiler requirement found for: content/cs/index.html, requirement: content/cs/2021-11-22-website-launch.md
  [DEBUG] Require content/cs/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/en/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/layout.html
  [DEBUG] Compiler requirement found for: content/en/2021-11-22-website-launch.md, requirement: templates/layout.html
  [DEBUG] Require templates/layout.html (snapshot _final)
  [DEBUG] Processing content/en/index.html
  [DEBUG] Compiler requirement found for: content/en/index.html, requirement: content/en/2021-11-22-website-launch.md
  [DEBUG] Require content/en/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/cs/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/cs/2021-11-22-website-launch.md (destination)])) (fromList [content/cs/2021-11-22-website-launch.md (destination)])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/2021-11-22-website-launch.md (destination)
  [DEBUG] Compiler requirement found for: content/cs/2021-11-22-website-launch.md, requirement: content/cs/2021-11-22-website-launch.md (destination)
  [DEBUG] Require content/cs/2021-11-22-website-launch.md (destination) (snapshot _final)
  [DEBUG] Processing content/cs/index.html
  [DEBUG] Compiler requirement found for: content/cs/index.html, requirement: content/cs/2021-11-22-website-launch.md
  [DEBUG] Require content/cs/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/en/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/cs/2021-11-22-website-launch.md (destination)])) (fromList [content/cs/2021-11-22-website-launch.md (destination)])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/2021-11-22-website-launch.md (destination)
  [DEBUG] Compiler requirement found for: content/en/2021-11-22-website-launch.md, requirement: content/cs/2021-11-22-website-launch.md (destination)
  [DEBUG] Require content/cs/2021-11-22-website-launch.md (destination) (snapshot _final)
  [DEBUG] Processing content/en/index.html
  [DEBUG] Compiler requirement found for: content/en/index.html, requirement: content/en/2021-11-22-website-launch.md
  [DEBUG] Require content/en/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/cs/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/en/2021-11-22-website-launch.md (destination)])) (fromList [content/en/2021-11-22-website-launch.md (destination)])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/2021-11-22-website-launch.md (destination)
  [DEBUG] Compiler requirement found for: content/cs/2021-11-22-website-launch.md, requirement: content/en/2021-11-22-website-launch.md (destination)
  [DEBUG] Require content/en/2021-11-22-website-launch.md (destination) (snapshot _final)
  [DEBUG] Processing content/cs/index.html
  [DEBUG] Compiler requirement found for: content/cs/index.html, requirement: content/cs/2021-11-22-website-launch.md
  [DEBUG] Require content/cs/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/en/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/en/2021-11-22-website-launch.md (destination)])) (fromList [content/en/2021-11-22-website-launch.md (destination)])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/2021-11-22-website-launch.md (destination)
  [DEBUG] Compiler requirement found for: content/en/2021-11-22-website-launch.md, requirement: content/en/2021-11-22-website-launch.md (destination)
  [DEBUG] Require content/en/2021-11-22-website-launch.md (destination) (snapshot _final)
  [DEBUG] Processing content/en/index.html
  [DEBUG] Compiler requirement found for: content/en/index.html, requirement: content/en/2021-11-22-website-launch.md
  [DEBUG] Require content/en/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/cs/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/2021-11-22-website-launch.md
  updated content/cs/2021-11-22-website-launch.md
  [DEBUG] Routed to _site/cs/2021-11-22-website-launch.html
  [DEBUG] Processing content/cs/index.html
  [DEBUG] Compiler requirement found for: content/cs/index.html, requirement: content/cs/2021-11-22-website-launch.md
  [DEBUG] Require content/cs/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/en/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/2021-11-22-website-launch.md
  updated content/en/2021-11-22-website-launch.md
  [DEBUG] Routed to _site/en/2021-11-22-website-launch.html
  [DEBUG] Processing content/en/index.html
  [DEBUG] Compiler requirement found for: content/en/index.html, requirement: content/en/2021-11-22-website-launch.md
  [DEBUG] Require content/en/2021-11-22-website-launch.md (snapshot _final)
  [DEBUG] Processing content/cs/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/posts.html
  [DEBUG] Compiler requirement found for: content/cs/index.html, requirement: templates/posts.html
  [DEBUG] Require templates/posts.html (snapshot _final)
  [DEBUG] Processing content/en/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/2021-11-22-website-launch.md
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/posts.html
  [DEBUG] Compiler requirement found for: content/en/index.html, requirement: templates/posts.html
  [DEBUG] Require templates/posts.html (snapshot _final)
  [DEBUG] Processing content/cs/index.html
  [DEBUG] Processing content/en/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/layout.html
  [DEBUG] Compiler requirement found for: content/cs/index.html, requirement: templates/layout.html
  [DEBUG] Require templates/layout.html (snapshot _final)
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency templates/layout.html
  [DEBUG] Compiler requirement found for: content/en/index.html, requirement: templates/layout.html
  [DEBUG] Require templates/layout.html (snapshot _final)
  [DEBUG] Processing content/cs/index.html
  [DEBUG] Processing content/en/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/cs/index.html (destination)])) (fromList [])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/en/index.html (destination)])) (fromList [])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/cs/index.html
  updated content/cs/index.html
  [DEBUG] Routed to _site/cs/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/index.html
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/cs/index.html (destination)])) (fromList [])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: PatternDependency (List (fromList [content/en/index.html (destination)])) (fromList [])
  [DEBUG] Hakyll.Core.Compiler.Internal: Adding dependency: IdentifierDependency content/en/index.html
  updated content/en/index.html
  [DEBUG] Routed to _site/en/index.html
Success
  [DEBUG] Removing tmp directory...
```

There is no cycle, according to the graph generated by https://github.com/jaspervdj/hakyll/pull/906:

[diagram](error.gv)

I recommend [`xdot`](https://github.com/jrfonseca/xdot.py) for viewing the graphs. [Edotor](https://edotor.net/) works in the web browser but does not support highlighting adjacent edges. Passing `-f fdp` to `xdot` might lay out the graph slightly more manageably.
