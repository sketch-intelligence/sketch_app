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
    print('the recation count is ${widget.postModel.reactions?.length}');
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
  final ReactionType? type;
  final String? asset;

  Reaction({this.type, this.asset});
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
  bool _showReactions = false;
  ReactionType? _selectedReaction;
  int _currentLikes = 0;

  final List<Reaction> _reactions = [
    Reaction(
      type: ReactionType.like,
      asset: Assets.imagesLike,
    ),
    Reaction(
      type: ReactionType.love,
      asset: Assets.imagesLove,
    ),
    Reaction(
      type: ReactionType.wow,
      asset: Assets.imagesWow,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() => _showReactions = false);
      }
    });
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void _toggleReactions() {
    setState(() {
      _showReactions = !_showReactions;
      if (_showReactions) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void _handleReaction(ReactionType type) {
    final isSameReaction = _selectedReaction == type;
    setState(() {
      _selectedReaction = isSameReaction ? null : type;
      _currentLikes += isSameReaction ? -1 : 1;
      _showReactions = false;
    });
    widget.onReactionChanged(_selectedReaction);
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleReactions,
      onLongPress: _toggleReactions,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: _toggleReactions,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildMainReaction(),
                const SizedBox(width: 8),
                Text(_currentLikes.toString()),
              ],
            ),
          ),
          if (_showReactions) _buildReactionsMenu(),
        ],
      ),
    );
  }

  Widget _buildReactionsMenu() {
    return Positioned(
      bottom: 40,
      left: 0, // Add horizontal positioning
      child: GestureDetector(
        onTap: () {}, // Capture taps on the menu area
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Material(
            color: Colors.transparent,
            child: Container(
              // ... existing container styling ...
              child: Row(
                children: _reactions.map((reaction) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: _buildReactionButton(reaction),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainReaction() {
    final reaction = _getReaction(_selectedReaction);
    return IconButton(
      iconSize: 24,
      icon: Image.asset(
        height: 24,
        width: 24,
        reaction?.asset ?? Assets.imagesLike,
      ),
      onPressed: _toggleReactions,
    );
  }

  Widget _buildReactionButton(Reaction reaction) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // Add this
      onTap: () {
        _handleReaction(reaction.type ?? ReactionType.like);
        _controller.reverse();
      },
      child: SizedBox(
        width: 36,
        height: 36,
        child: Image.asset(
          reaction.asset ?? Assets.imagesArtificialBrain,
          width: 24,
          height: 24,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error);
          },
        ),
      ),
    );
  }

  Reaction? _getReaction(ReactionType? type) {
    if (type == null) return null;
    try {
      return _reactions.firstWhere((r) => r.type == type);
    } catch (e) {
      return null;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
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
