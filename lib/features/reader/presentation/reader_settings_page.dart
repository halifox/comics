import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import 'package:comics/shared/presentation/hooks/glass_large_title_hook.dart';

import '../application/reader_settings_provider.dart';

class ReaderSettingsPage extends HookConsumerWidget {
  const ReaderSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(readerSettingsProvider);
    final titleController = useGlassLargeTitleController();
    final background = settings.background;

    return CupertinoTheme(
      data: CupertinoTheme.of(
        context,
      ).copyWith(brightness: background.brightness),
      child: GlassScaffold(
        statusBarStyle: GlassStatusBarStyle.auto,
        background: ColoredBox(color: background.color),
        appBar: GlassAppBar(
          title: const Text(
            '阅读设置',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          largeTitleController: titleController,
          leading: GlassIconButton(
              icon: const Icon(CupertinoIcons.chevron_back),
              onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: CustomScrollView(
          controller: titleController.scrollController,
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          slivers: [
            GlassLargeTitle(
              text: '阅读设置',
              controller: titleController,
              padding: EdgeInsets.fromLTRB(
                24,
                MediaQuery.paddingOf(context).top + 56,
                24,
                16,
              ),
            ),
            SliverToBoxAdapter(
              child: GlassGroupedSection(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  GlassListTile(
                    leading: const Icon(CupertinoIcons.rectangle_split_3x1),
                    title: const Text('阅读模式'),
                    trailing: ReaderModeSelector(
                      value: settings.mode,
                      onChanged: (value) {
                        ref
                            .read(readerSettingsProvider.notifier)
                            .setMode(value: value);
                      },
                    ),
                  ),
                  GlassListTile(
                    leading: const Icon(CupertinoIcons.paintbrush),
                    title: const Text('阅读背景'),
                    trailing: ReaderBackgroundSelector(
                      value: settings.background,
                      onChanged: (value) {
                        ref
                            .read(readerSettingsProvider.notifier)
                            .setBackground(value: value);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReaderModeSelector extends StatelessWidget {
  const ReaderModeSelector({required this.value, required this.onChanged});

  final ReaderMode value;
  final ValueChanged<ReaderMode> onChanged;

  @override
  Widget build(BuildContext context) {
    return GlassMenu(
      trigger: CompactDropdownLabel(label: value.label),
      menuWidth: 210,
      menuAlignment: GlassMenuAlignment.topRight,
      autoAdjustToScreen: true,
      items: [
        for (final option in ReaderMode.values)
          GlassMenuItem(
            title: option.label,
            isSelected: value == option,
            trailing: value == option
                ? const Icon(CupertinoIcons.checkmark, size: 18)
                : null,
            onTap: () => onChanged(option),
          ),
      ],
    );
  }
}

class ReaderBackgroundSelector extends StatelessWidget {
  const ReaderBackgroundSelector({
    required this.value,
    required this.onChanged,
  });

  final ReaderBackground value;
  final ValueChanged<ReaderBackground> onChanged;

  @override
  Widget build(BuildContext context) {
    return GlassMenu(
      trigger: CompactDropdownLabel(label: value.label),
      menuWidth: 210,
      menuAlignment: GlassMenuAlignment.topRight,
      autoAdjustToScreen: true,
      items: [
        for (final option in ReaderBackground.values)
          GlassMenuItem(
            title: option.label,
            icon: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: option.color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: CupertinoColors.separator.resolveFrom(context),
                ),
              ),
            ),
            isSelected: value == option,
            trailing: value == option
                ? const Icon(CupertinoIcons.checkmark, size: 18)
                : null,
            onTap: () => onChanged(option),
          ),
      ],
    );
  }
}

class CompactDropdownLabel extends StatelessWidget {
  const CompactDropdownLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 6),
          Icon(
            CupertinoIcons.chevron_down,
            size: 14,
            color: CupertinoColors.secondaryLabel.resolveFrom(context),
          ),
        ],
      ),
    );
  }
}
