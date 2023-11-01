import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class TeamCardWidget extends StatelessWidget {
  final Team team;
  final ValueChanged<Team>? onTap;

  const TeamCardWidget({super.key, required this.team, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(team),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 15,
              spreadRadius: 0,
            ),
          ],
        ),
        margin: const EdgeInsets.all(4),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          width: 2.5,
                        )),
                    child: ImageWidget(
                      team.avatar!,
                      width: 50,
                      height: 50,
                      borderRadius: 50,
                    ),
                  ),
                ),
              ),
              Text(
                'Team',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 9,
                    ),
              ),
              if (team.name?.isNotEmpty ?? false)
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(top: 4, right: 16, left: 16),
                    child: Text(
                      team.name!.replaceAll('Team ', ''),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  '${team.codeId}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 9,
                        color: const Color(0xFF828282),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
