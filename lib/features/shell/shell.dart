import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../app/config.dart';
import '../../app/theme_controller.dart';
import '../../app/lang_controller.dart';
import '../../core/services/auth_service.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/l10n.dart';

class Shell extends StatelessWidget {
  final Widget child;
  const Shell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final cfg = context.read<AppConfig>();
    final auth = context.watch<AuthService>(); // react to login/logout

    // Collapse actions into a Drawer when width is compact to avoid overflow.
    final width = MediaQuery.of(context).size.width;
    final isCompact = width < 900;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: isCompact ? 0 : null,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: isCompact ? 8 : 12),
          child: InkWell(
            onTap: () => context.go('/'),
            child: Text(cfg.siteName, overflow: TextOverflow.ellipsis),
          ),
        ),
        actions: isCompact
            ? null
            : [
                _nav(context, '/', context.l10n.navHome),

                // Work menu: combined Projects + Labs under a single dropdown
                PopupMenuButton<String>(
                  onSelected: (v) {
                    // Navigate to /work with an optional filter query param
                    if (v == 'all') {
                      context.go('/work');
                    } else {
                      context.go('/work?f=$v');
                    }
                  },
                  child: TextButton(
                    onPressed: null,
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.onSurface,
                      ),
                      textStyle: WidgetStateProperty.all(
                        Theme.of(context).textTheme.labelLarge,
                      ),
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      splashFactory: NoSplash.splashFactory,
                    ),
                    child: const Text('Work'),
                  ),
                  itemBuilder: (ctx) {
                    final c = Theme.of(ctx).colorScheme.onSurface;
                    return [
                      PopupMenuItem(
                        value: 'all',
                        child: Row(
                          children: [
                            Icon(Icons.view_list, size: 18, color: c),
                            const SizedBox(width: 8),
                            Text('All', style: TextStyle(color: c)),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'projects',
                        child: Row(
                          children: [
                            Icon(Icons.work_outline, size: 18, color: c),
                            const SizedBox(width: 8),
                            Text(
                              context.l10n.navProjects,
                              style: TextStyle(color: c),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'labs',
                        child: Row(
                          children: [
                            Icon(Icons.science_outlined, size: 18, color: c),
                            const SizedBox(width: 8),
                            Text(
                              context.l10n.navLabs,
                              style: TextStyle(color: c),
                            ),
                          ],
                        ),
                      ),
                    ];
                  },
                ),

                // Explore menu: group Blog, Library, People
                PopupMenuButton<String>(
                  onSelected: (v) {
                    switch (v) {
                      case 'blog':
                        context.go('/blog');
                        break;
                      case 'library':
                        context.go('/library');
                        break;
                      case 'people':
                        context.go('/people');
                        break;
                    }
                  },
                  child: TextButton(
                    onPressed: null,
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.onSurface,
                      ),
                      textStyle: WidgetStateProperty.all(
                        Theme.of(context).textTheme.labelLarge,
                      ),
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      splashFactory: NoSplash.splashFactory,
                    ),
                    child: const Text('Explore'),
                  ),
                  itemBuilder: (ctx) {
                    final c = Theme.of(ctx).colorScheme.onSurface;
                    return [
                      PopupMenuItem(
                        value: 'blog',
                        child: Row(
                          children: [
                            Icon(Icons.article_outlined, size: 18, color: c),
                            const SizedBox(width: 8),
                            Text(
                              context.l10n.navBlog,
                              style: TextStyle(color: c),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'library',
                        child: Row(
                          children: [
                            Icon(Icons.menu_book_outlined, size: 18, color: c),
                            const SizedBox(width: 8),
                            Text(
                              context.l10n.navLibrary,
                              style: TextStyle(color: c),
                            ),
                          ],
                        ),
                      ),
                      const PopupMenuDivider(),
                      PopupMenuItem(
                        value: 'people',
                        child: Row(
                          children: [
                            Icon(Icons.people_outlined, size: 18, color: c),
                            const SizedBox(width: 8),
                            Text('People', style: TextStyle(color: c)),
                          ],
                        ),
                      ),
                    ];
                  },
                ),
                if (cfg.showMeta) _nav(context, '/meta', context.l10n.navMeta),

                // About menu: contains Foundation and other about-related pages
                PopupMenuButton<String>(
                  onSelected: (v) {
                    switch (v) {
                      case 'about':
                        context.go('/pages/about');
                        break;
                      case 'foundation':
                        context.go('/foundation');
                        break;
                      case 'credits':
                        context.go('/pages/credits');
                        break;
                    }
                  },
                  child: TextButton(
                    onPressed: null,
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.onSurface,
                      ),
                      textStyle: WidgetStateProperty.all(
                        Theme.of(context).textTheme.labelLarge,
                      ),
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      splashFactory: NoSplash.splashFactory,
                    ),
                    child: const Text('About'),
                  ),
                  itemBuilder: (ctx) {
                    final c = Theme.of(ctx).colorScheme.onSurface;
                    return [
                      PopupMenuItem(
                        value: 'about',
                        child: Row(
                          children: [
                            Icon(Icons.info_outline, size: 18, color: c),
                            const SizedBox(width: 8),
                            Text('About', style: TextStyle(color: c)),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'foundation',
                        child: Row(
                          children: [
                            Icon(Icons.layers_outlined, size: 18, color: c),
                            const SizedBox(width: 8),
                            Text(
                              context.l10n.navFoundation,
                              style: TextStyle(color: c),
                            ),
                          ],
                        ),
                      ),
                      const PopupMenuDivider(),
                      PopupMenuItem(
                        value: 'credits',
                        child: Row(
                          children: [
                            Icon(Icons.star_outline, size: 18, color: c),
                            const SizedBox(width: 8),
                            Text('Credits', style: TextStyle(color: c)),
                          ],
                        ),
                      ),
                    ];
                  },
                ),
                _nav(context, '/timeline', context.l10n.navTimeline),
                _nav(context, '/services', context.l10n.navServices),
                _nav(context, '/contact', context.l10n.navContact),
                _nav(context, '/resume', context.l10n.navResume),
                const SizedBox(width: 4),
                const _LanguageButton(),
                const SizedBox(width: 4),
                const _ThemeButton(),
                const SizedBox(width: 8),
                // Toggle Login/Logout label based on auth state
                auth.isLoggedIn
                    ? TextButton(
                        onPressed: () => context.read<AuthService>().logout(),
                        child: const Text('Logout'),
                      )
                    : _nav(context, '/login', context.l10n.navLogin),
                const SizedBox(width: 8),
              ],
      ),
      drawer: isCompact ? _MobileDrawer(showMeta: cfg.showMeta) : null,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.pagePadding),
          child: child,
        ),
      ),
    );
  }

  Widget _nav(BuildContext context, String path, String label) {
    final style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      textStyle: Theme.of(context).textTheme.labelLarge,
    );
    return TextButton(
      onPressed: () => context.go(path),
      style: style,
      child: Text(label),
    );
  }
}

class _MobileDrawer extends StatelessWidget {
  final bool showMeta;
  const _MobileDrawer({required this.showMeta});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            _tile(context, '/', context.l10n.navHome, Icons.home_outlined),
            const Divider(height: 16),
            _tile(context, '/work', 'Work', Icons.apps_outlined),
            // _tile(
            //   context,
            //   '/projects',
            //   context.l10n.navProjects,
            //   Icons.apps_outlined,
            // ),
            _tile(
              context,
              '/blog',
              context.l10n.navBlog,
              Icons.article_outlined,
            ),
            // _tile(
            //   context,
            //   '/labs',
            //   context.l10n.navLabs,
            //   Icons.science_outlined,
            // ),
            _tile(
              context,
              '/library',
              context.l10n.navLibrary,
              Icons.menu_book_outlined,
            ),
            const Divider(height: 16),
            // Explore group
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Explore',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            _tile(
              context,
              '/blog',
              context.l10n.navBlog,
              Icons.article_outlined,
            ),
            _tile(
              context,
              '/library',
              context.l10n.navLibrary,
              Icons.menu_book_outlined,
            ),
            _tile(context, '/people', 'People', Icons.people_outlined),
            if (showMeta)
              _tile(
                context,
                '/meta',
                context.l10n.navMeta,
                Icons.account_tree_outlined,
              ),
            const Divider(height: 8),
            // About group
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4,
              ),
              child: Text(
                'About',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            _tile(context, '/pages/about', 'About', Icons.info_outline),
            _tile(
              context,
              '/foundation',
              context.l10n.navFoundation,
              Icons.layers_outlined,
            ),
            _tile(context, '/pages/credits', 'Credits', Icons.star_outline),
            const Divider(height: 16),
            _tile(
              context,
              '/timeline',
              context.l10n.navTimeline,
              Icons.timeline,
            ),
            _tile(
              context,
              '/services',
              context.l10n.navServices,
              Icons.handyman_outlined,
            ),
            _tile(
              context,
              '/contact',
              context.l10n.navContact,
              Icons.mail_outline,
            ),
            _tile(
              context,
              '/resume',
              context.l10n.navResume,
              Icons.description_outlined,
            ),
            const Divider(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: _LanguageButton(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: _ThemeButton(),
            ),
            ListTile(
              leading: Icon(auth.isLoggedIn ? Icons.logout : Icons.lock_open),
              title: Text(auth.isLoggedIn ? 'Logout' : context.l10n.navLogin),
              onTap: () {
                Navigator.of(context).pop();
                if (auth.isLoggedIn) {
                  context.read<AuthService>().logout();
                } else {
                  context.go('/login');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  ListTile _tile(
    BuildContext context,
    String route,
    String label,
    IconData icon,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        Navigator.of(context).pop();
        context.go(route);
      },
    );
  }
}

class _ThemeButton extends StatelessWidget {
  const _ThemeButton();

  @override
  Widget build(BuildContext context) {
    final themeCtrl = context.watch<ThemeController>();
    return PopupMenuButton<String>(
      tooltip: context.l10n.menuTheme,
      icon: const Icon(Icons.palette_outlined),
      onSelected: (v) {
        if (v.startsWith('mode:')) {
          switch (v.split(':')[1]) {
            case 'system':
              themeCtrl.setMode(ThemeMode.system);
              break;
            case 'light':
              themeCtrl.setMode(ThemeMode.light);
              break;
            case 'dark':
              themeCtrl.setMode(ThemeMode.dark);
              break;
          }
        } else if (v.startsWith('palette:')) {
          final name = v.split(':')[1];
          final map = {
            'metal': AppPalette.metal,
            'earth': AppPalette.earth,
            'wood': AppPalette.wood,
            'fire': AppPalette.fire,
            'water': AppPalette.water,
          };
          themeCtrl.setPalette(map[name] ?? AppPalette.metal);
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(enabled: false, child: Text(context.l10n.menuThemeMode)),
        PopupMenuItem(
          value: 'mode:system',
          child: Text(context.l10n.themeSystem),
        ),
        PopupMenuItem(
          value: 'mode:light',
          child: Text(context.l10n.themeLight),
        ),
        PopupMenuItem(value: 'mode:dark', child: Text(context.l10n.themeDark)),
        const PopupMenuDivider(),
        PopupMenuItem(enabled: false, child: Text(context.l10n.menuPalette)),
        PopupMenuItem(
          value: 'palette:metal',
          child: Text(context.l10n.paletteMetal),
        ),
        PopupMenuItem(
          value: 'palette:earth',
          child: Text(context.l10n.paletteEarth),
        ),
        PopupMenuItem(
          value: 'palette:wood',
          child: Text(context.l10n.paletteWood),
        ),
        PopupMenuItem(
          value: 'palette:fire',
          child: Text(context.l10n.paletteFire),
        ),
        PopupMenuItem(
          value: 'palette:water',
          child: Text(context.l10n.paletteWater),
        ),
      ],
    );
  }
}

class _LanguageButton extends StatelessWidget {
  const _LanguageButton();

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<LanguageController>();
    return PopupMenuButton<String>(
      tooltip: context.l10n.menuLanguage,
      icon: const Icon(Icons.language),
      onSelected: (v) {
        switch (v) {
          case 'system':
            lang.setLocale(null);
            break;
          case 'en':
            lang.setLocale(const Locale('en'));
            break;
          case 'zh':
            lang.setLocale(const Locale('zh'));
            break;
          case 'ms':
            lang.setLocale(const Locale('ms'));
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(enabled: false, child: Text(context.l10n.menuLanguage)),
        const PopupMenuDivider(),
        PopupMenuItem(value: 'system', child: Text(context.l10n.themeSystem)),
        const PopupMenuDivider(),
        PopupMenuItem(value: 'en', child: Text(context.l10n.langEnglish)),
        PopupMenuItem(value: 'zh', child: Text(context.l10n.langChinese)),
        PopupMenuItem(value: 'ms', child: Text(context.l10n.langMalay)),
      ],
    );
  }
}
