



<!DOCTYPE html>
<html lang="en" class="">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    
    
    <title>Gmail2Calendar/20141123121630_initial_set_up.rb at stash_migrations · snugglelamb/Gmail2Calendar</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="snugglelamb/Gmail2Calendar" name="twitter:title" /><meta content="Gmail2Calendar - CIT 597 term project" name="twitter:description" /><meta content="https://avatars2.githubusercontent.com/u/7934918?v=3&amp;s=400" name="twitter:image:src" />
<meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars2.githubusercontent.com/u/7934918?v=3&amp;s=400" property="og:image" /><meta content="snugglelamb/Gmail2Calendar" property="og:title" /><meta content="https://github.com/snugglelamb/Gmail2Calendar" property="og:url" /><meta content="Gmail2Calendar - CIT 597 term project" property="og:description" />

      <meta name="browser-stats-url" content="/_stats">
    <link rel="assets" href="https://assets-cdn.github.com/">
    <link rel="conduit-xhr" href="https://ghconduit.com:25035">
    <link rel="xhr-socket" href="/_sockets">
    <meta name="pjax-timeout" content="1000">
    <link rel="sudo-modal" href="/sessions/sudo_modal">

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>
      <meta name="google-analytics" content="UA-3769691-2">

    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="A57BD7CE:67CF:18A0CF36:5472958B" name="octolytics-dimension-request_id" /><meta content="7934918" name="octolytics-actor-id" /><meta content="snugglelamb" name="octolytics-actor-login" /><meta content="e9e281df7034229f8f5c743c73e5ea0026feeeed7f5ad437447993c2e272e8ed" name="octolytics-actor-hash" />
    <meta content="/private/private/blob/show" name="analytics-location" />
    <meta content="Rails, view, blob#show" name="analytics-event" />

    
    
    <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">


    <meta content="authenticity_token" name="csrf-param" />
<meta content="YcE5h/bMm9W7Pcq0myMEYN9BtAZxEUiOre+MVKYoQcUmq3Mqa2F3ng+awazJTpaDQThUWAyRCBNyE+zk2rkWgA==" name="csrf-token" />

    <link href="https://assets-cdn.github.com/assets/github-fa9b8c5d848205db514d4097d2b78f4528d01a79f39601e0f9c5c40ed6894711.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://assets-cdn.github.com/assets/github2-7b28b896e6eeb8d651cacd5f4a4d1490fbe9d05dbc92221609350b0ce7a68e9a.css" media="all" rel="stylesheet" type="text/css" />
    
    


    <meta http-equiv="x-pjax-version" content="a3ac1570158331332f4e32c9da80623c">

      
  <meta name="description" content="Gmail2Calendar - CIT 597 term project">
  <meta name="go-import" content="github.com/snugglelamb/Gmail2Calendar git https://github.com/snugglelamb/Gmail2Calendar.git">

  <meta content="7934918" name="octolytics-dimension-user_id" /><meta content="snugglelamb" name="octolytics-dimension-user_login" /><meta content="25884017" name="octolytics-dimension-repository_id" /><meta content="snugglelamb/Gmail2Calendar" name="octolytics-dimension-repository_nwo" /><meta content="false" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="25884017" name="octolytics-dimension-repository_network_root_id" /><meta content="snugglelamb/Gmail2Calendar" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/snugglelamb/Gmail2Calendar/commits/stash_migrations.atom?token=AHkTxjPhewM8luEG-8go0ojmzomuwO07ks6yf8gSwA%3D%3D" rel="alternate" title="Recent Commits to Gmail2Calendar:stash_migrations" type="application/atom+xml">

  </head>


  <body class="logged_in  env-production macintosh vis-private page-blob">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>
    <div class="wrapper">
      
      
      
      


      <div class="header header-logged-in true" role="banner">
  <div class="container clearfix">

    <a class="header-logo-invertocat" href="https://github.com/" data-hotkey="g d" aria-label="Homepage" ga-data-click="Header, go to dashboard, icon:logo">
  <span class="mega-octicon octicon-mark-github"></span>
</a>


      <div class="site-search repo-scope js-site-search" role="search">
          <form accept-charset="UTF-8" action="/snugglelamb/Gmail2Calendar/search" class="js-site-search-form" data-global-search-url="/search" data-repo-search-url="/snugglelamb/Gmail2Calendar/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
  <input type="text"
    class="js-site-search-field is-clearable"
    data-hotkey="s"
    name="q"
    placeholder="Search"
    data-global-scope-placeholder="Search GitHub"
    data-repo-scope-placeholder="Search"
    tabindex="1"
    autocapitalize="off">
  <div class="scope-badge">This repository</div>
</form>
      </div>
      <ul class="header-nav left" role="navigation">
        <li class="header-nav-item explore">
          <a class="header-nav-link" href="/explore" data-ga-click="Header, go to explore, text:explore">Explore</a>
        </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="https://gist.github.com" data-ga-click="Header, go to gist, text:gist">Gist</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="/blog" data-ga-click="Header, go to blog, text:blog">Blog</a>
          </li>
        <li class="header-nav-item">
          <a class="header-nav-link" href="https://help.github.com" data-ga-click="Header, go to help, text:help">Help</a>
        </li>
      </ul>

    
<ul class="header-nav user-nav right" id="user-links">
  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link name" href="/snugglelamb" data-ga-click="Header, go to profile, text:username">
      <img alt="Z.Li" class="avatar" data-user="7934918" height="20" src="https://avatars1.githubusercontent.com/u/7934918?v=3&amp;s=40" width="20" />
      <span class="css-truncate">
        <span class="css-truncate-target">snugglelamb</span>
      </span>
    </a>
  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link js-menu-target tooltipped tooltipped-s" href="#" aria-label="Create new..." data-ga-click="Header, create new, icon:add">
      <span class="octicon octicon-plus"></span>
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      
<ul class="dropdown-menu">
  <li>
    <a href="/new"><span class="octicon octicon-repo"></span> New repository</a>
  </li>
  <li>
    <a href="/organizations/new"><span class="octicon octicon-organization"></span> New organization</a>
  </li>


    <li class="dropdown-divider"></li>
    <li class="dropdown-header">
      <span title="snugglelamb/Gmail2Calendar">This repository</span>
    </li>
      <li>
        <a href="/snugglelamb/Gmail2Calendar/issues/new"><span class="octicon octicon-issue-opened"></span> New issue</a>
      </li>
      <li>
        <a href="/snugglelamb/Gmail2Calendar/settings/collaboration"><span class="octicon octicon-person"></span> New collaborator</a>
      </li>
</ul>

    </div>
  </li>

  <li class="header-nav-item">
        <a href="/notifications" aria-label="You have no unread notifications" class="header-nav-link notification-indicator tooltipped tooltipped-s" data-ga-click="Header, go to notifications, icon:read" data-hotkey="g n">
        <span class="mail-status all-read"></span>
        <span class="octicon octicon-inbox"></span>
</a>
  </li>

  <li class="header-nav-item">
    <a class="header-nav-link tooltipped tooltipped-s" href="/settings/profile" id="account_settings" aria-label="Settings" data-ga-click="Header, go to settings, icon:settings">
      <span class="octicon octicon-gear"></span>
    </a>
  </li>

  <li class="header-nav-item">
    <form accept-charset="UTF-8" action="/logout" class="logout-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="ReAoWDyeYmyi8hftlStjeyYEJ7/jzbn70psAIVJOan8qxvcRC17GLDMjGjrcQN2FWwZWbHy5QT3z5KtdQ9x0jw==" /></div>
      <button class="header-nav-link sign-out-button tooltipped tooltipped-s" aria-label="Sign out" data-ga-click="Header, sign out, icon:logout">
        <span class="octicon octicon-sign-out"></span>
      </button>
</form>  </li>

</ul>


    
  </div>
</div>

      

        


      <div id="start-of-content" class="accessibility-aid"></div>
          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    <div id="js-flash-container">
      
    </div>
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        
<ul class="pagehead-actions">

    <li class="subscription">
      <form accept-charset="UTF-8" action="/notifications/subscribe" class="js-social-container" data-autosubmit="true" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="D4/3ZKK79f1x8yeJpG37hh/GqIIZExzN3FufBUmrgPqo4kSBQLolnGI8PcSPV2x6zjWYwzPXQqYrmqu+3FXMeQ==" /></div>  <input id="repository_id" name="repository_id" type="hidden" value="25884017" />

    <div class="select-menu js-menu-container js-select-menu">
      <a class="social-count js-social-count" href="/snugglelamb/Gmail2Calendar/watchers">
        6
      </a>
      <a href="/snugglelamb/Gmail2Calendar/subscription"
        class="minibutton select-menu-button with-count js-menu-target" role="button" tabindex="0" aria-haspopup="true">
        <span class="js-select-button">
          <span class="octicon octicon-eye"></span>
          Unwatch
        </span>
      </a>

      <div class="select-menu-modal-holder">
        <div class="select-menu-modal subscription-menu-modal js-menu-content" aria-hidden="true">
          <div class="select-menu-header">
            <span class="select-menu-title">Notifications</span>
            <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
          </div> <!-- /.select-menu-header -->

          <div class="select-menu-list js-navigation-container" role="menu">

            <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input id="do_included" name="do" type="radio" value="included" />
                <h4>Not watching</h4>
                <span class="description">Be notified when participating or @mentioned.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-eye"></span>
                  Watch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item selected" role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input checked="checked" id="do_subscribed" name="do" type="radio" value="subscribed" />
                <h4>Watching</h4>
                <span class="description">Be notified of all conversations.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-eye"></span>
                  Unwatch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input id="do_ignore" name="do" type="radio" value="ignore" />
                <h4>Ignoring</h4>
                <span class="description">Never be notified.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-mute"></span>
                  Stop ignoring
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

          </div> <!-- /.select-menu-list -->

        </div> <!-- /.select-menu-modal -->
      </div> <!-- /.select-menu-modal-holder -->
    </div> <!-- /.select-menu -->

</form>
    </li>

  <li>
    
  <div class="js-toggler-container js-social-container starring-container ">

    <form accept-charset="UTF-8" action="/snugglelamb/Gmail2Calendar/unstar" class="js-toggler-form starred js-unstar-button" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="T2gNIk5uvnNa6cUEqPbdLMqJcvLJirzLGqHhUgKF+YcI/WLYenJSp8xt/Q9GFz/uiMxvydJ6cwjSRs2c95wXyQ==" /></div>
      <button
        class="minibutton with-count js-toggler-target star-button"
        aria-label="Unstar this repository" title="Unstar snugglelamb/Gmail2Calendar">
        <span class="octicon octicon-star"></span>
        Unstar
      </button>
        <a class="social-count js-social-count" href="/snugglelamb/Gmail2Calendar/stargazers">
          0
        </a>
</form>
    <form accept-charset="UTF-8" action="/snugglelamb/Gmail2Calendar/star" class="js-toggler-form unstarred js-star-button" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="4iKRvLWkMfilHoybGtdlr0LKGSm9vriZinMxV4SK7hqfpQ+svjart6vbzav7vpTXHB+Wi1jPMDlqotuqnurnaw==" /></div>
      <button
        class="minibutton with-count js-toggler-target star-button"
        aria-label="Star this repository" title="Star snugglelamb/Gmail2Calendar">
        <span class="octicon octicon-star"></span>
        Star
      </button>
        <a class="social-count js-social-count" href="/snugglelamb/Gmail2Calendar/stargazers">
          0
        </a>
</form>  </div>

  </li>


        <li>
          <a href="/snugglelamb/Gmail2Calendar/fork" class="minibutton with-count js-toggler-target fork-button tooltipped-n" title="Fork your own copy of snugglelamb/Gmail2Calendar to your account" aria-label="Fork your own copy of snugglelamb/Gmail2Calendar to your account" rel="nofollow" data-method="post">
            <span class="octicon octicon-repo-forked"></span>
            Fork
          </a>
          <a href="/snugglelamb/Gmail2Calendar/network" class="social-count">0</a>
        </li>

</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title private">
          <span class="mega-octicon octicon-lock"></span>
          <span class="author"><a href="/snugglelamb" class="url fn" itemprop="url" rel="author"><span itemprop="title">snugglelamb</span></a></span><!--
       --><span class="path-divider">/</span><!--
       --><strong><a href="/snugglelamb/Gmail2Calendar" class="js-current-repository" data-pjax="#js-repo-pjax-container">Gmail2Calendar</a></strong>
            <span class="repo-private-label">private</span>

          <span class="page-context-loader">
            <img alt="" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">
      <div class="repository-with-sidebar repo-container new-discussion-timeline  ">
        <div class="repository-sidebar clearfix">
            
<nav class="sunken-menu repo-nav js-repo-nav js-sidenav-container-pjax js-octicon-loaders"
     role="navigation"
     data-pjax="#js-repo-pjax-container"
     data-issue-count-url="/snugglelamb/Gmail2Calendar/issues/counts">
  <ul class="sunken-menu-group">
    <li class="tooltipped tooltipped-w" aria-label="Code">
      <a href="/snugglelamb/Gmail2Calendar/tree/stash_migrations" aria-label="Code" class="selected js-selected-navigation-item sunken-menu-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /snugglelamb/Gmail2Calendar/tree/stash_migrations">
        <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

      <li class="tooltipped tooltipped-w" aria-label="Issues">
        <a href="/snugglelamb/Gmail2Calendar/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /snugglelamb/Gmail2Calendar/issues">
          <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
          <span class="js-issue-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

    <li class="tooltipped tooltipped-w" aria-label="Pull Requests">
      <a href="/snugglelamb/Gmail2Calendar/pulls" aria-label="Pull Requests" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g p" data-selected-links="repo_pulls /snugglelamb/Gmail2Calendar/pulls">
          <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
          <span class="js-pull-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>


      <li class="tooltipped tooltipped-w" aria-label="Wiki">
        <a href="/snugglelamb/Gmail2Calendar/wiki" aria-label="Wiki" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g w" data-selected-links="repo_wiki /snugglelamb/Gmail2Calendar/wiki">
          <span class="octicon octicon-book"></span> <span class="full-word">Wiki</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
  </ul>
  <div class="sunken-menu-separator"></div>
  <ul class="sunken-menu-group">

    <li class="tooltipped tooltipped-w" aria-label="Pulse">
      <a href="/snugglelamb/Gmail2Calendar/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-selected-links="pulse /snugglelamb/Gmail2Calendar/pulse">
        <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

    <li class="tooltipped tooltipped-w" aria-label="Graphs">
      <a href="/snugglelamb/Gmail2Calendar/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-selected-links="repo_graphs repo_contributors /snugglelamb/Gmail2Calendar/graphs">
        <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>
  </ul>


    <div class="sunken-menu-separator"></div>
    <ul class="sunken-menu-group">
      <li class="tooltipped tooltipped-w" aria-label="Settings">
        <a href="/snugglelamb/Gmail2Calendar/settings" aria-label="Settings" class="js-selected-navigation-item sunken-menu-item" data-selected-links="repo_settings /snugglelamb/Gmail2Calendar/settings">
          <span class="octicon octicon-tools"></span> <span class="full-word">Settings</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
    </ul>
</nav>

              <div class="only-with-full-nav">
                
  
<div class="clone-url open"
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=push">
  <h3><span class="text-emphasized">HTTPS</span> clone URL</h3>
  <div class="input-group">
    <input type="text" class="input-mini input-monospace js-url-field"
           value="https://github.com/snugglelamb/Gmail2Calendar.git" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="https://github.com/snugglelamb/Gmail2Calendar.git" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="clone-url "
  data-protocol-type="ssh"
  data-url="/users/set_protocol?protocol_selector=ssh&amp;protocol_type=push">
  <h3><span class="text-emphasized">SSH</span> clone URL</h3>
  <div class="input-group">
    <input type="text" class="input-mini input-monospace js-url-field"
           value="git@github.com:snugglelamb/Gmail2Calendar.git" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="git@github.com:snugglelamb/Gmail2Calendar.git" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=push">
  <h3><span class="text-emphasized">Subversion</span> checkout URL</h3>
  <div class="input-group">
    <input type="text" class="input-mini input-monospace js-url-field"
           value="https://github.com/snugglelamb/Gmail2Calendar" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="https://github.com/snugglelamb/Gmail2Calendar" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>


<p class="clone-options">You can clone with
      <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a>,
      <a href="#" class="js-clone-selector" data-protocol="ssh">SSH</a>,
      or <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>.
  <a href="https://help.github.com/articles/which-remote-url-should-i-use" class="help tooltipped tooltipped-n" aria-label="Get help on which URL is right for you.">
    <span class="octicon octicon-question"></span>
  </a>
</p>

  <a href="http://mac.github.com" data-url="github-mac://openRepo/https://github.com/snugglelamb/Gmail2Calendar" class="minibutton sidebar-button js-conduit-rewrite-url" title="Save snugglelamb/Gmail2Calendar to your computer and use it in GitHub Desktop." aria-label="Save snugglelamb/Gmail2Calendar to your computer and use it in GitHub Desktop.">
    <span class="octicon octicon-device-desktop"></span>
    Clone in Desktop
  </a>


                <a href="/snugglelamb/Gmail2Calendar/archive/stash_migrations.zip"
                   class="minibutton sidebar-button"
                   aria-label="Download the contents of snugglelamb/Gmail2Calendar as a zip file"
                   title="Download the contents of snugglelamb/Gmail2Calendar as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
              </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
          

<a href="/snugglelamb/Gmail2Calendar/blob/d604767fc6b3bd7bd512a8954a3c626be3b4831b/db/migrate/20141123121630_initial_set_up.rb" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:4f86c7bdb20a625f842edeadd78a0ef5 -->

<div class="file-navigation">
  
<div class="select-menu js-menu-container js-select-menu left">
  <span class="minibutton select-menu-button js-menu-target css-truncate" data-hotkey="w"
    data-master-branch="master"
    data-ref="stash_migrations"
    title="stash_migrations"
    role="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button css-truncate-target">stash_migratio…</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
      </div> <!-- /.select-menu-header -->

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Find or create a branch…" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Find or create a branch…">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div><!-- /.select-menu-tabs -->
      </div><!-- /.select-menu-filters -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/snugglelamb/Gmail2Calendar/blob/devise_demo/db/migrate/20141123121630_initial_set_up.rb"
                 data-name="devise_demo"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="devise_demo">devise_demo</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/snugglelamb/Gmail2Calendar/blob/master/db/migrate/20141123121630_initial_set_up.rb"
                 data-name="master"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="master">master</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/snugglelamb/Gmail2Calendar/blob/stash_migrations/db/migrate/20141123121630_initial_set_up.rb"
                 data-name="stash_migrations"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="stash_migrations">stash_migrations</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/snugglelamb/Gmail2Calendar/blob/test-devise%26google_omni/db/migrate/20141123121630_initial_set_up.rb"
                 data-name="test-devise&amp;google_omni"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="test-devise&amp;google_omni">test-devise&amp;google_omni</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/snugglelamb/Gmail2Calendar/blob/test_devise%26google_omni_v2/db/migrate/20141123121630_initial_set_up.rb"
                 data-name="test_devise&amp;google_omni_v2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="test_devise&amp;google_omni_v2">test_devise&amp;google_omni_v2</a>
            </div> <!-- /.select-menu-item -->
        </div>

          <form accept-charset="UTF-8" action="/snugglelamb/Gmail2Calendar/branches" class="js-create-branch select-menu-item select-menu-new-item-form js-navigation-item js-new-item-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="1R+MAbb9IfD6JRx2OncyOEllAv4A8ZZSvGJfY+6b5WbLbPaLiqpO9lWD+5SQbw+63d0q17/r3duUM+5PeBpVcg==" /></div>
            <span class="octicon octicon-git-branch select-menu-item-icon"></span>
            <div class="select-menu-item-text">
              <h4>Create branch: <span class="js-new-item-name"></span></h4>
              <span class="description">from ‘stash_migrations’</span>
            </div>
            <input type="hidden" name="name" id="name" class="js-new-item-value">
            <input type="hidden" name="branch" id="branch" value="stash_migrations">
            <input type="hidden" name="path" id="path" value="db/migrate/20141123121630_initial_set_up.rb">
          </form> <!-- /.select-menu-item -->

      </div> <!-- /.select-menu-list -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

    </div> <!-- /.select-menu-modal -->
  </div> <!-- /.select-menu-modal-holder -->
</div> <!-- /.select-menu -->

  <div class="button-group right">
    <a href="/snugglelamb/Gmail2Calendar/find/stash_migrations"
          class="js-show-file-finder minibutton empty-icon tooltipped tooltipped-s"
          data-pjax
          data-hotkey="t"
          aria-label="Quickly jump between files">
      <span class="octicon octicon-list-unordered"></span>
    </a>
    <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="db/migrate/20141123121630_initial_set_up.rb" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
  </div>

  <div class="breadcrumb">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/snugglelamb/Gmail2Calendar/tree/stash_migrations" class="" data-branch="stash_migrations" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">Gmail2Calendar</span></a></span></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/snugglelamb/Gmail2Calendar/tree/stash_migrations/db" class="" data-branch="stash_migrations" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">db</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/snugglelamb/Gmail2Calendar/tree/stash_migrations/db/migrate" class="" data-branch="stash_migrations" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">migrate</span></a></span><span class="separator"> / </span><strong class="final-path">20141123121630_initial_set_up.rb</strong>
  </div>
</div>


  <div class="commit file-history-tease">
    <div class="file-history-tease-header">
        <img alt="edwinlou26" class="avatar" data-user="6855345" height="24" src="https://avatars2.githubusercontent.com/u/6855345?v=3&amp;s=48" width="24" />
        <span class="author"><a href="/edwinlou26" rel="contributor">edwinlou26</a></span>
        <time datetime="2014-11-23T17:29:37Z" is="relative-time">Nov 23, 2014</time>
        <div class="commit-title">
            <a href="/snugglelamb/Gmail2Calendar/commit/e1924aadb349f3bec60e79419e83574655c3417f" class="message" data-pjax="true" title="stashed migrations so far

no need for “rake db:reset” in the course of migrating to the top">stashed migrations so far</a>
        </div>
    </div>

    <div class="participation">
      <p class="quickstat">
        <a href="#blob_contributors_box" rel="facebox">
          <strong>1</strong>
           contributor
        </a>
      </p>
      
    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
          <li class="facebox-user-list-item">
            <img alt="edwinlou26" data-user="6855345" height="24" src="https://avatars2.githubusercontent.com/u/6855345?v=3&amp;s=48" width="24" />
            <a href="/edwinlou26">edwinlou26</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file-box">
  <div class="file">
    <div class="meta clearfix">
      <div class="info file-name">
          <span>51 lines (43 sloc)</span>
          <span class="meta-divider"></span>
        <span>1.727 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
          <a href="/snugglelamb/Gmail2Calendar/raw/stash_migrations/db/migrate/20141123121630_initial_set_up.rb" class="minibutton " id="raw-url">Raw</a>
            <a href="/snugglelamb/Gmail2Calendar/blame/stash_migrations/db/migrate/20141123121630_initial_set_up.rb" class="minibutton js-update-url-with-hash">Blame</a>
          <a href="/snugglelamb/Gmail2Calendar/commits/stash_migrations/db/migrate/20141123121630_initial_set_up.rb" class="minibutton " rel="nofollow">History</a>
        </div><!-- /.button-group -->

          <a class="octicon-button tooltipped tooltipped-nw js-conduit-openfile-check"
             href="http://mac.github.com"
             data-url="github-mac://openRepo/https://github.com/snugglelamb/Gmail2Calendar?branch=stash_migrations&amp;filepath=db%2Fmigrate%2F20141123121630_initial_set_up.rb"
             aria-label="Open this file in GitHub for Mac"
             data-failed-title="Your version of GitHub for Mac is too old to open this file. Try checking for updates.">
              <span class="octicon octicon-device-desktop"></span>
          </a>

              <a class="octicon-button js-update-url-with-hash"
                 href="/snugglelamb/Gmail2Calendar/edit/stash_migrations/db/migrate/20141123121630_initial_set_up.rb"
                 aria-label="Edit this file"
                 data-method="post" rel="nofollow" data-hotkey="e"><span class="octicon octicon-pencil"></span></a>

            <a class="octicon-button danger"
               href="/snugglelamb/Gmail2Calendar/delete/stash_migrations/db/migrate/20141123121630_initial_set_up.rb"
               aria-label="Delete this file"
               data-method="post" data-test-id="delete-blob-file" rel="nofollow">
          <span class="octicon octicon-trashcan"></span>
        </a>
      </div><!-- /.actions -->
    </div>
    

  <div class="blob-wrapper data type-ruby">
      <table class="highlight tab-size-8 js-file-line-container">
      <tr>
        <td id="L1" class="blob-num js-line-number" data-line-number="1"></td>
        <td id="LC1" class="blob-code js-file-line"><span class="pl-k">class</span> <span class="pl-en">InitialSetUp<span class="pl-e"> &lt; ActiveRecord::Migration</span></span></td>
      </tr>
      <tr>
        <td id="L2" class="blob-num js-line-number" data-line-number="2"></td>
        <td id="LC2" class="blob-code js-file-line">  <span class="pl-k">def</span> <span class="pl-en">change</span></td>
      </tr>
      <tr>
        <td id="L3" class="blob-num js-line-number" data-line-number="3"></td>
        <td id="LC3" class="blob-code js-file-line">    create_table <span class="pl-s1"><span class="pl-pds">&quot;</span>events<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">force:</span> <span class="pl-c1">true</span> <span class="pl-k">do </span>|<span class="pl-vo">t</span>|</td>
      </tr>
      <tr>
        <td id="L4" class="blob-num js-line-number" data-line-number="4"></td>
        <td id="LC4" class="blob-code js-file-line">      t.string   <span class="pl-s1"><span class="pl-pds">&quot;</span>name<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L5" class="blob-num js-line-number" data-line-number="5"></td>
        <td id="LC5" class="blob-code js-file-line">      t.datetime <span class="pl-s1"><span class="pl-pds">&quot;</span>schedule<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L6" class="blob-num js-line-number" data-line-number="6"></td>
        <td id="LC6" class="blob-code js-file-line">      t.string   <span class="pl-s1"><span class="pl-pds">&quot;</span>location<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L7" class="blob-num js-line-number" data-line-number="7"></td>
        <td id="LC7" class="blob-code js-file-line">      t.integer  <span class="pl-s1"><span class="pl-pds">&quot;</span>mygmail_id<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L8" class="blob-num js-line-number" data-line-number="8"></td>
        <td id="LC8" class="blob-code js-file-line">      t.datetime <span class="pl-s1"><span class="pl-pds">&quot;</span>created_at<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">null:</span> <span class="pl-c1">false</span></td>
      </tr>
      <tr>
        <td id="L9" class="blob-num js-line-number" data-line-number="9"></td>
        <td id="LC9" class="blob-code js-file-line">      t.datetime <span class="pl-s1"><span class="pl-pds">&quot;</span>updated_at<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">null:</span> <span class="pl-c1">false</span></td>
      </tr>
      <tr>
        <td id="L10" class="blob-num js-line-number" data-line-number="10"></td>
        <td id="LC10" class="blob-code js-file-line">    <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L11" class="blob-num js-line-number" data-line-number="11"></td>
        <td id="LC11" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L12" class="blob-num js-line-number" data-line-number="12"></td>
        <td id="LC12" class="blob-code js-file-line">    add_index <span class="pl-s1"><span class="pl-pds">&quot;</span>events<span class="pl-pds">&quot;</span></span>, [<span class="pl-s1"><span class="pl-pds">&quot;</span>mygmail_id<span class="pl-pds">&quot;</span></span>], <span class="pl-c1">name:</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>index_events_on_mygmail_id<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L13" class="blob-num js-line-number" data-line-number="13"></td>
        <td id="LC13" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L14" class="blob-num js-line-number" data-line-number="14"></td>
        <td id="LC14" class="blob-code js-file-line">    create_table <span class="pl-s1"><span class="pl-pds">&quot;</span>mygmails<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">force:</span> <span class="pl-c1">true</span> <span class="pl-k">do </span>|<span class="pl-vo">t</span>|</td>
      </tr>
      <tr>
        <td id="L15" class="blob-num js-line-number" data-line-number="15"></td>
        <td id="LC15" class="blob-code js-file-line">      t.string   <span class="pl-s1"><span class="pl-pds">&quot;</span>eid<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L16" class="blob-num js-line-number" data-line-number="16"></td>
        <td id="LC16" class="blob-code js-file-line">      t.datetime <span class="pl-s1"><span class="pl-pds">&quot;</span>created_at<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">null:</span> <span class="pl-c1">false</span></td>
      </tr>
      <tr>
        <td id="L17" class="blob-num js-line-number" data-line-number="17"></td>
        <td id="LC17" class="blob-code js-file-line">      t.datetime <span class="pl-s1"><span class="pl-pds">&quot;</span>updated_at<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">null:</span> <span class="pl-c1">false</span></td>
      </tr>
      <tr>
        <td id="L18" class="blob-num js-line-number" data-line-number="18"></td>
        <td id="LC18" class="blob-code js-file-line">      t.integer  <span class="pl-s1"><span class="pl-pds">&quot;</span>user_id<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L19" class="blob-num js-line-number" data-line-number="19"></td>
        <td id="LC19" class="blob-code js-file-line">      t.text     <span class="pl-s1"><span class="pl-pds">&quot;</span>content<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L20" class="blob-num js-line-number" data-line-number="20"></td>
        <td id="LC20" class="blob-code js-file-line">    <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L21" class="blob-num js-line-number" data-line-number="21"></td>
        <td id="LC21" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L22" class="blob-num js-line-number" data-line-number="22"></td>
        <td id="LC22" class="blob-code js-file-line">    add_index <span class="pl-s1"><span class="pl-pds">&quot;</span>mygmails<span class="pl-pds">&quot;</span></span>, [<span class="pl-s1"><span class="pl-pds">&quot;</span>user_id<span class="pl-pds">&quot;</span></span>], <span class="pl-c1">name:</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>index_mygmails_on_user_id<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L23" class="blob-num js-line-number" data-line-number="23"></td>
        <td id="LC23" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L24" class="blob-num js-line-number" data-line-number="24"></td>
        <td id="LC24" class="blob-code js-file-line">    create_table <span class="pl-s1"><span class="pl-pds">&quot;</span>users<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">force:</span> <span class="pl-c1">true</span> <span class="pl-k">do </span>|<span class="pl-vo">t</span>|</td>
      </tr>
      <tr>
        <td id="L25" class="blob-num js-line-number" data-line-number="25"></td>
        <td id="LC25" class="blob-code js-file-line">      t.string   <span class="pl-s1"><span class="pl-pds">&quot;</span>name<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L26" class="blob-num js-line-number" data-line-number="26"></td>
        <td id="LC26" class="blob-code js-file-line">      t.string   <span class="pl-s1"><span class="pl-pds">&quot;</span>psw<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L27" class="blob-num js-line-number" data-line-number="27"></td>
        <td id="LC27" class="blob-code js-file-line">      t.string   <span class="pl-s1"><span class="pl-pds">&quot;</span>account<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L28" class="blob-num js-line-number" data-line-number="28"></td>
        <td id="LC28" class="blob-code js-file-line">      t.datetime <span class="pl-s1"><span class="pl-pds">&quot;</span>created_at<span class="pl-pds">&quot;</span></span>,                          <span class="pl-c1">null:</span> <span class="pl-c1">false</span></td>
      </tr>
      <tr>
        <td id="L29" class="blob-num js-line-number" data-line-number="29"></td>
        <td id="LC29" class="blob-code js-file-line">      t.datetime <span class="pl-s1"><span class="pl-pds">&quot;</span>updated_at<span class="pl-pds">&quot;</span></span>,                          <span class="pl-c1">null:</span> <span class="pl-c1">false</span></td>
      </tr>
      <tr>
        <td id="L30" class="blob-num js-line-number" data-line-number="30"></td>
        <td id="LC30" class="blob-code js-file-line">      t.string   <span class="pl-s1"><span class="pl-pds">&quot;</span>email<span class="pl-pds">&quot;</span></span>,                  <span class="pl-c1">default:</span> <span class="pl-s1"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>, <span class="pl-c1">null:</span> <span class="pl-c1">false</span></td>
      </tr>
      <tr>
        <td id="L31" class="blob-num js-line-number" data-line-number="31"></td>
        <td id="LC31" class="blob-code js-file-line">      t.string   <span class="pl-s1"><span class="pl-pds">&quot;</span>encrypted_password<span class="pl-pds">&quot;</span></span>,     <span class="pl-c1">default:</span> <span class="pl-s1"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>, <span class="pl-c1">null:</span> <span class="pl-c1">false</span></td>
      </tr>
      <tr>
        <td id="L32" class="blob-num js-line-number" data-line-number="32"></td>
        <td id="LC32" class="blob-code js-file-line">      t.string   <span class="pl-s1"><span class="pl-pds">&quot;</span>reset_password_token<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L33" class="blob-num js-line-number" data-line-number="33"></td>
        <td id="LC33" class="blob-code js-file-line">      t.datetime <span class="pl-s1"><span class="pl-pds">&quot;</span>reset_password_sent_at<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L34" class="blob-num js-line-number" data-line-number="34"></td>
        <td id="LC34" class="blob-code js-file-line">      t.datetime <span class="pl-s1"><span class="pl-pds">&quot;</span>remember_created_at<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L35" class="blob-num js-line-number" data-line-number="35"></td>
        <td id="LC35" class="blob-code js-file-line">      t.integer  <span class="pl-s1"><span class="pl-pds">&quot;</span>sign_in_count<span class="pl-pds">&quot;</span></span>,          <span class="pl-c1">default:</span> <span class="pl-c1">0</span>,  <span class="pl-c1">null:</span> <span class="pl-c1">false</span></td>
      </tr>
      <tr>
        <td id="L36" class="blob-num js-line-number" data-line-number="36"></td>
        <td id="LC36" class="blob-code js-file-line">      t.datetime <span class="pl-s1"><span class="pl-pds">&quot;</span>current_sign_in_at<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L37" class="blob-num js-line-number" data-line-number="37"></td>
        <td id="LC37" class="blob-code js-file-line">      t.datetime <span class="pl-s1"><span class="pl-pds">&quot;</span>last_sign_in_at<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L38" class="blob-num js-line-number" data-line-number="38"></td>
        <td id="LC38" class="blob-code js-file-line">      t.string   <span class="pl-s1"><span class="pl-pds">&quot;</span>current_sign_in_ip<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L39" class="blob-num js-line-number" data-line-number="39"></td>
        <td id="LC39" class="blob-code js-file-line">      t.string   <span class="pl-s1"><span class="pl-pds">&quot;</span>last_sign_in_ip<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L40" class="blob-num js-line-number" data-line-number="40"></td>
        <td id="LC40" class="blob-code js-file-line">      t.string   <span class="pl-s1"><span class="pl-pds">&quot;</span>provider<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L41" class="blob-num js-line-number" data-line-number="41"></td>
        <td id="LC41" class="blob-code js-file-line">      t.string   <span class="pl-s1"><span class="pl-pds">&quot;</span>uid<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L42" class="blob-num js-line-number" data-line-number="42"></td>
        <td id="LC42" class="blob-code js-file-line">      t.string   <span class="pl-s1"><span class="pl-pds">&quot;</span>token<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L43" class="blob-num js-line-number" data-line-number="43"></td>
        <td id="LC43" class="blob-code js-file-line">    <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L44" class="blob-num js-line-number" data-line-number="44"></td>
        <td id="LC44" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L45" class="blob-num js-line-number" data-line-number="45"></td>
        <td id="LC45" class="blob-code js-file-line">    add_index <span class="pl-s1"><span class="pl-pds">&quot;</span>users<span class="pl-pds">&quot;</span></span>, [<span class="pl-s1"><span class="pl-pds">&quot;</span>email<span class="pl-pds">&quot;</span></span>], <span class="pl-c1">name:</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>index_users_on_email<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">unique:</span> <span class="pl-c1">true</span></td>
      </tr>
      <tr>
        <td id="L46" class="blob-num js-line-number" data-line-number="46"></td>
        <td id="LC46" class="blob-code js-file-line">    add_index <span class="pl-s1"><span class="pl-pds">&quot;</span>users<span class="pl-pds">&quot;</span></span>, [<span class="pl-s1"><span class="pl-pds">&quot;</span>reset_password_token<span class="pl-pds">&quot;</span></span>], <span class="pl-c1">name:</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>index_users_on_reset_password_token<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">unique:</span> <span class="pl-c1">true</span></td>
      </tr>
      <tr>
        <td id="L47" class="blob-num js-line-number" data-line-number="47"></td>
        <td id="LC47" class="blob-code js-file-line">    </td>
      </tr>
      <tr>
        <td id="L48" class="blob-num js-line-number" data-line-number="48"></td>
        <td id="LC48" class="blob-code js-file-line">  <span class="pl-k">end</span> <span class="pl-c">#end of def change</span></td>
      </tr>
      <tr>
        <td id="L49" class="blob-num js-line-number" data-line-number="49"></td>
        <td id="LC49" class="blob-code js-file-line">  </td>
      </tr>
      <tr>
        <td id="L50" class="blob-num js-line-number" data-line-number="50"></td>
        <td id="LC50" class="blob-code js-file-line">  </td>
      </tr>
      <tr>
        <td id="L51" class="blob-num js-line-number" data-line-number="51"></td>
        <td id="LC51" class="blob-code js-file-line"><span class="pl-k">end</span> <span class="pl-c">#end of class</span></td>
      </tr>
</table>

  </div>

  </div>
</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" class="js-jump-to-line-form">
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="button">Go</button>
  </form>
</div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links right">
      <li><a href="https://status.github.com/">Status</a></li>
      <li><a href="https://developer.github.com">API</a></li>
      <li><a href="http://training.github.com">Training</a></li>
      <li><a href="http://shop.github.com">Shop</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="/about">About</a></li>

    </ul>

    <a href="/" aria-label="Homepage">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2014 <span title="0.04560s from github-fe117-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="/site/terms">Terms</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
  </div><!-- /.site-footer -->
</div><!-- /.container -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-suggester-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="fullscreen-contents js-fullscreen-contents js-suggester-field" placeholder=""></textarea>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped tooltipped-w" aria-label="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped tooltipped-w"
      aria-label="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-x flash-close js-ajax-error-dismiss" aria-label="Dismiss error"></a>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" src="https://assets-cdn.github.com/assets/frameworks-2d727fed4d969b14b28165c75ad12d7dddd56c0198fa70cedc3fdad7ac395b2c.js" type="text/javascript"></script>
      <script async="async" crossorigin="anonymous" src="https://assets-cdn.github.com/assets/github-f3e9a2204fcfc6f7dde250e61ca35353411880024102cba14a0bd45f05f1e74f.js" type="text/javascript"></script>
      
      
  </body>
</html>

