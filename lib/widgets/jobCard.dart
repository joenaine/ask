import 'package:flutter/material.dart';
import 'package:teaching_app/repository/data.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var job = joblistFinal[index];
        return GestureDetector(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => JobDetails(
            //       jobs: job,
            //     ),
            //   ),
            // );
          },
          child: const JobCard(),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: joblistFinal.length,
    );
  }
}
