import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/network/program_rule_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';

import 'package:http/http.dart' as http;
import 'package:newborn_care/utils/dhis2_config.dart';

class ProgramRuleRepository {
  final BuildContext context;
  final HiveStorageRepository hiveStorageRepository;
  ProgramRuleRepository(this.context, this.hiveStorageRepository);
  void updateProgramRules() async {
    ProgramRuleClient client = new ProgramRuleClient(http.Client(), context);
    Profile profile = hiveStorageRepository.getProfile();
    var normal = await client.fetchProgramRules(
        profile.username, profile.password, DHIS2Config.programRuleNormalID);
    var problem = await client.fetchProgramRules(
        profile.username, profile.password, DHIS2Config.programRuleProblemID);
    var danger = await client.fetchProgramRules(
        profile.username, profile.password, DHIS2Config.programRuleDangerID);
    hiveStorageRepository.saveProgramRule(
        DHIS2Config.programRuleNormalID, jsonDecode(normal)["condition"]);
    hiveStorageRepository.saveProgramRule(
        DHIS2Config.programRuleProblemID, jsonDecode(problem)["condition"]);
    hiveStorageRepository.saveProgramRule(
        DHIS2Config.programRuleDangerID, jsonDecode(danger)["condition"]);
  }
}
