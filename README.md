# Devise

A fast, minimal, responsive [Hugo](https://gohugo.io/) theme for blogs.

![screenshot.png](https://raw.githubusercontent.com/austingebauer/devise/master/images/screenshot.png)

For a live demo of the theme, see at: 
- [themes.gohugo.io/devise](https://themes.gohugo.io/devise)
- [austingebauer.com](https://austingebauer.com)

## Configuration Features

- General
    - Hugo's Builtin [Content Management](https://gohugo.io/content-management/) Features
    - Google Analytics
- Header
    - Title and Subtitle
    - Image
    - Navigation Menu
    - [Font Awesome](https://fontawesome.com/) Icons with Links
- Main Body
    - Last 'N' Recent Pages
    - Categorical Page Grouping

## Usage

This following guides installation, configuration, and updating of the Devise Hugo theme.

### Installation

Before installing this theme, be sure to [install Hugo](https://gohugo.io/getting-started/quick-start/) 
and [create a new site](https://gohugo.io/getting-started/quick-start/#step-2-create-a-new-site).

To install the theme, run the following from the root directory of your Hugo site:

```bash
$ git submodule add https://github.com/austingebauer/devise.git themes/devise
```

### Configuration

Next, open the `config.toml` file in the root of your Hugo site and set the theme:

```toml
theme = "devise"
```

Example `config.toml` file with all configuration features filled out:

```toml
baseURL = "https://example.com"
title = "Your Website Title"
languageCode = "en-us"
theme = "devise"
relativeURLs = true
enableEmoji = true
googleAnalytics = ""
enableRobotsTXT = true
copyright = "&copy; Copyright Year, Your Name"

# Main menu items
[menu]
  [[menu.main]]
    identifier = "about"
    name = "About"
    title = "About"
    url = "/about/"
    weight = -110
  [[menu.main]]
    identifier = "posts"
    name = "Posts"
    title = "Posts"
    url = "/post/"
    weight = -100
  [[menu.main]]
    identifier = "categories"
    name = "Categories"
    title = "Categories"
    url = "/categories/"
    weight = -90

# Configuration Features
[params]
  header_title = "Your Name"                 # Your header title
  header_subtitle = "Your Creative Subtitle" # Your header subtitle
  home_image = "/images/avatar.png"          # Path to header image starting from the static directory
  recent_posts = 5                           # Max amount of recent posts to show
  mainSections = ["posts", "post", "blog"]   # Main sections to include in recent posts
  [[params.social]]
    fa_icon = "fab fa-github fa-1x"          # Font Awesome icon class
    href = "http://github.com/youruser"      # Link to associate with icon (http://, https://, mailto:)
  [[params.social]]
    fa_icon = "fab fa-linkedin-in fa-1x"
    href = ""
  [[params.social]]
    fa_icon = "fab fa-twitter fa-1x"
    href = ""
  [[params.social]]
    fa_icon = "fas fa-at fa-1x"
    href = ""
```

### Updating

To get updates to the theme, run the following from the root directory of your Hugo site: 

```
$ git submodule update --remote themes/devise
```

## Demo

To run a live demo of the theme on your laptop, run the following from the `exampleSite` directory of the 
devise theme:

```bash
hugo server --themesDir ../.. --watch --verbose --cleanDestinationDir --disableFastRender
```

For a live demo of the theme, see at: 
- [themes.gohugo.io/devise](https://themes.gohugo.io/devise)
- [austingebauer.com](https://austingebauer.com)

## Contributing

If you have an idea for a new feature or found a bug, please feel free to use Github
[issues](https://github.com/austingebauer/devise/issues) to let me know.

## License

[MIT](LICENSE)
