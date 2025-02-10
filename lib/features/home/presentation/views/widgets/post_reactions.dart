import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/features/home/data/models/post_model/post_model.dart';

class PostReactions extends StatefulWidget {
  const PostReactions({
    super.key,
    required this.postModel,
  });

  final PostModel postModel;

  @override
  State<PostReactions> createState() => _PostReactionsState();
}

class _PostReactionsState extends State<PostReactions> {
  ReactionType? selectedReaction;

  @override
  Widget build(BuildContext context) {
    // print('the recation count is ${widget.postModel.reactions?.length}');
    return Row(
      children: [
        PostLikes(
          initialLikes: widget.postModel.reactions?.length ?? 0,
          initialReaction: selectedReaction,
          onReactionChanged: (newReaction) {
            setState(() {
              print('okay');
              selectedReaction = newReaction;
              // Update your backend here
            });
          },
        ),
        const SizedBox(
          width: 26,
        ),
        PostComments(commentCount: widget.postModel.comments?.length ?? 0),
        const Spacer(),
        // PostShares(shareCount: postModel.shares.length)
      ],
    );
  }
}

class PostComments extends StatelessWidget {
  PostComments({
    super.key,
    required this.commentCount,
  });

  int commentCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.imagesComments,
          color: AppColors.grey3C,
          height: 18,
          width: 18,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(commentCount.toString())
      ],
    );
  }
}

enum ReactionType { like, love, laugh, wow, sad, angry }

class Reaction {
  final ReactionType type;
  final String asset;

  Reaction({required this.type, required this.asset});
}

class PostLikes extends StatefulWidget {
  final int initialLikes;
  final ReactionType? initialReaction;
  final ValueChanged<ReactionType?> onReactionChanged;

  const PostLikes({
    super.key,
    required this.initialLikes,
    this.initialReaction,
    required this.onReactionChanged,
  });

  @override
  State<PostLikes> createState() => _PostLikesState();
}

class _PostLikesState extends State<PostLikes>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  ReactionType? _selectedReaction;
  late int _currentLikes;
  bool _isLongPressing = false;
  final GlobalKey _likeButtonKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  Offset _menuPosition = Offset.zero;

  final List<Reaction> _reactions = [
    Reaction(type: ReactionType.like, asset: Assets.imagesLike),
    Reaction(type: ReactionType.love, asset: Assets.imagesLove),
    Reaction(type: ReactionType.wow, asset: Assets.imagesWow),
  ];

  @override
  void initState() {
    super.initState();
    _selectedReaction = widget.initialReaction;
    _currentLikes = widget.initialLikes;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void _handleLike() {
    if (_isLongPressing) return;

    final isSameReaction = _selectedReaction == ReactionType.like;
    setState(() {
      _selectedReaction = isSameReaction ? null : ReactionType.like;
      _currentLikes += isSameReaction ? -1 : 1;
    });
    widget.onReactionChanged(_selectedReaction);
  }

  void _showReactionsMenu() {
    final buttonRenderBox =
        _likeButtonKey.currentContext?.findRenderObject() as RenderBox?;
    if (buttonRenderBox == null) return;

    final buttonPosition = buttonRenderBox.localToGlobal(Offset.zero);
    final screenSize = MediaQuery.of(context).size;
    final paddingTop = MediaQuery.of(context).padding.top;
    final paddingBottom = MediaQuery.of(context).padding.bottom;

    // Create overlay entry
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _hideReactionsMenu,
          child: Material(
            color: Colors.transparent,
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Calculate position after layout
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  final menuRenderBox =
                      context.findRenderObject() as RenderBox?;
                  if (menuRenderBox == null) return;

                  final menuHeight = menuRenderBox.size.height;
                  final menuWidth = menuRenderBox.size.width;

                  // Fixed clamp bounds calculation
                  double lowerBound = 8.0;
                  double upperBound = screenSize.width - menuWidth - 8;
                  upperBound = upperBound.clamp(lowerBound, double.infinity);
                  double left = buttonPosition.dx.clamp(lowerBound, upperBound);

                  // Vertical positioning
                  double top = buttonPosition.dy - menuHeight - 10;
                  double bottomEdge = top + menuHeight;
                  double screenBottom = screenSize.height - paddingBottom;

                  if (top < paddingTop) {
                    top = buttonPosition.dy + buttonRenderBox.size.height + 10;
                    bottomEdge = top + menuHeight;
                    if (bottomEdge > screenBottom)
                      top = screenBottom - menuHeight - 8;
                  } else if (bottomEdge > screenBottom) {
                    top = screenBottom - menuHeight - 8;
                  }

                  _overlayEntry?.markNeedsBuild();
                  setState(() => _menuPosition = Offset(left, top));
                });

                return Positioned(
                  left: _menuPosition.dx,
                  top: _menuPosition.dy,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width -
                              16, // Fixed constraint
                          maxHeight: MediaQuery.of(context).size.height * 0.5,
                        ),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                spreadRadius: 1),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: _reactions.map((reaction) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: _buildReactionButton(reaction),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
    _controller.forward();
  }

  void _handleReaction(ReactionType type) {
    _hideReactionsMenu();
    final isSameReaction = _selectedReaction == type;
    setState(() {
      _selectedReaction = isSameReaction ? null : type;
      _currentLikes += isSameReaction ? -1 : 1;
    });
    widget.onReactionChanged(_selectedReaction);
  }

  void _hideReactionsMenu() {
    _controller.reverse().then((_) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleLike,
      onLongPressStart: (_) {
        _isLongPressing = true;
        _showReactionsMenu();
      },
      onLongPressEnd: (_) {
        _isLongPressing = false;
      },
      child: Row(
        key: _likeButtonKey,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildMainReaction(),
          const SizedBox(width: 8),
          Text(_currentLikes.toString()),
        ],
      ),
    );
  }

  Widget _buildMainReaction() {
    final reaction = _reactions.firstWhere(
      (r) => r.type == _selectedReaction,
      orElse: () => _reactions[0],
    );
    return IconButton(
      iconSize: 24,
      icon: Image.asset(
        reaction.asset,
        height: 24,
        width: 24,
      ),
      onPressed: _handleLike,
    );
  }

  Widget _buildReactionButton(Reaction reaction) {
    return GestureDetector(
      onTap: () => _handleReaction(reaction.type),
      child: SizedBox(
        width: 36,
        height: 36,
        child: Image.asset(
          reaction.asset,
          width: 24,
          height: 24,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }
}

class PostShares extends StatelessWidget {
  PostShares({
    super.key,
    required this.shareCount,
  });

  int shareCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.imagesShareNetwork,
          color: AppColors.grey3C,
          height: 18,
          width: 18,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(shareCount.toString())
      ],
    );
  }
}
