import 'package:currency/utilities/app_colors.dart';
import 'package:currency/utilities/app_string.dart';
import 'package:currency/view%20model/main/details/details_cubit.dart';
import 'package:currency/view/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key, this.id}) : super(key: key);
  String? id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  //late final String id;
  @override
  void initState() {
    context.read<DetailsCubit>().getCoinDetails(widget.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DetailsCubit, DetailsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is DetailsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DetailsSuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(context
                        .read<DetailsCubit>()
                        .detailsModel
                        .image
                        .toString()),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultText(
                                text: context
                                    .read<DetailsCubit>()
                                    .detailsModel
                                    .id
                                    .toString()),
                            Row(
                              children: [
                                const DefaultText(text: AppStrings.rank),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: DefaultText(
                                    text: context
                                        .read<DetailsCubit>()
                                        .detailsModel
                                        .marketCapRank
                                        .toString(),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        DefaultText(
                            text: context
                                .read<DetailsCubit>()
                                .detailsModel
                                .symbol
                                .toString()),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            DefaultText(
                                text: context
                                    .read<DetailsCubit>()
                                    .detailsModel
                                    .currentPrice
                                    .toString()),
                            //DefaultText(text: "343"),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 30.h,
                      child: SfCartesianChart(
                          // Initialize category axis
                          primaryXAxis: CategoryAxis(),
                          //borderColor: AppColors.secondaryColor,
                          backgroundColor: AppColors.secondaryColor,
                          series: <LineSeries<SalesData, String>>[
                            LineSeries<SalesData, String>(
                                // Bind data source
                                dataSource: <SalesData>[
                                  SalesData('1y', context
                                      .read<DetailsCubit>()
                                      .detailsModel.percentChange_1y),
                                  SalesData('200d', context
                                      .read<DetailsCubit>()
                                      .detailsModel.percentChange_200),
                                  SalesData('60', context
                                      .read<DetailsCubit>()
                                      .detailsModel.percentChange_60),
                                  SalesData('Apr', context
                                      .read<DetailsCubit>()
                                      .detailsModel.percentChange_30),
                                  SalesData('14', context
                                      .read<DetailsCubit>()
                                      .detailsModel.percentChange_14),
                                  SalesData('7', context
                                      .read<DetailsCubit>()
                                      .detailsModel.percentChange_7d),
                                  SalesData('24', context
                                      .read<DetailsCubit>()
                                      .detailsModel.percentChange_24h)
                                ],
                                color: AppColors.primaryColor,
                                dataLabelSettings: const DataLabelSettings(isVisible: true),

                                xValueMapper: (SalesData sales, _) => sales.year,
                                yValueMapper: (SalesData sales, _) => sales.sales,
                            )
                          ]),
                    ),
                    Container(
                        //height: 50.h,
                        margin: const EdgeInsets.all(10),
                        width: double.infinity,
                        child: DefaultText(
                          maxLines: 200,
                          text: context
                              .read<DetailsCubit>()
                              .detailsModel
                              .description
                              .toString(),
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text(AppStrings.error),
            );
          }
        },
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double? sales;
}
