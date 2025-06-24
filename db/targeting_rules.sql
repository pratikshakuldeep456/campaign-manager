-- Batch 1: 100 INSERT statements for targeting_rules

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'f7e8a1b2-c3d4-4e5f-8a9b-0c1d2e3f4a5b', 'Rule_1_14Stores_new_user_vip_AllSKUs', 'Targets 14 specific stores user groups: new_user, vip for all SKUs - Rule 1', false, ARRAY['store_42','store_43','store_18','store_27','store_39','store_48','store_10','store_1','store_33','store_16','store_47','store_2','store_29','store_23'],
             false, ARRAY['new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_1'
         );


update targeting_rules set rule_expression=ARRAY['user.average_order_value > 200'] where id='1304b4a8-d2e6-4f6f-8655-c5e52b942675';
update targeting_rules set rule_expression=ARRAY['user.average_order_value > 800'] where id='ecd78b2a-efb9-4fc2-a55d-01d956309043';

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d', 'Rule_2_AllStores_corporate_account_new_user_vip_8SKUs', 'Targets all stores user groups: corporate_account, new_user, vip for 8 specific SKUs - Rule 2', true, ARRAY[]::TEXT[],
             false, ARRAY['corporate_account','new_user','vip'], false, ARRAY['item_048','item_073','item_055','item_001','item_076','item_017','item_065','item_054'], 'rule_expression_2'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'b2c3d4e5-f6a7-4b8c-9d0e-1f2a3b4c5d6e', 'Rule_3_11Stores_AllUsers_AllSKUs', 'Targets 11 specific stores all users for all SKUs - Rule 3', false, ARRAY['store_13','store_14','store_43','store_12','store_38','store_33','store_4','store_44','store_41','store_2','store_17'],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_3'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'c3d4e5f6-a7b8-4c9d-0e1f-2a3b4c5d6e7f', 'Rule_4_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 4', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_4'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'd4e5f6a7-b8c9-4d0e-1f2a-3b4c5d6e7f8a', 'Rule_5_13Stores_corporate_account_new_user_vip_AllSKUs', 'Targets 13 specific stores user groups: corporate_account, new_user, vip for all SKUs - Rule 5', false, ARRAY['store_12','store_13','store_24','store_27','store_25','store_20','store_18','store_11','store_30','store_16','store_46','store_35','store_49'],
             false, ARRAY['corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_5'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'e5f6a7b8-c9d0-4e1f-2a3b-4c5d6e7f8a9b', 'Rule_6_AllStores_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: corporate_account, new_user, vip for all SKUs - Rule 6', true, ARRAY[]::TEXT[],
             false, ARRAY['corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_6'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'f6a7b8c9-d0e1-4f2a-3b4c-5d6e7f8a9b0c', 'Rule_7_19Stores_AllUsers_AllSKUs', 'Targets 19 specific stores all users for all SKUs - Rule 7', false, ARRAY['store_35','store_23','store_40','store_31','store_24','store_30','store_18','store_4','store_14','store_44','store_32','store_1','store_48','store_46','store_37','store_13','store_17','store_22','store_15'],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_7'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'a7b8c9d0-e1f2-4a3b-4c5d-6e7f8a9b0c1d', 'Rule_8_16Stores_corporate_account_vip_7SKUs', 'Targets 16 specific stores user groups: corporate_account, vip for 7 specific SKUs - Rule 8', false, ARRAY['store_32','store_25','store_21','store_4','store_15','store_17','store_34','store_20','store_22','store_45','store_36','store_14','store_40','store_3','store_18','store_33'],
             false, ARRAY['corporate_account','vip'], false, ARRAY['item_043','item_098','item_087','item_061','item_078','item_073','item_079'], 'rule_expression_8'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'b8c9d0e1-f2a3-4b4c-5d6e-7f8a9b0c1d2e', 'Rule_9_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 9', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_9'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'c9d0e1f2-a3b4-4c5d-6e7f-8a9b0c1d2e3f', 'Rule_10_16Stores_new_user_vip_AllSKUs', 'Targets 16 specific stores user groups: new_user, vip for all SKUs - Rule 10', false, ARRAY['store_4','store_27','store_19','store_37','store_33','store_16','store_11','store_25','store_49','store_2','store_1','store_39','store_50','store_22','store_35','store_45'],
             false, ARRAY['new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_10'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'd0e1f2a3-b4c5-4d6e-7f8a-9b0c1d2e3f4a', 'Rule_11_AllStores_vip_10SKUs', 'Targets all stores user groups: vip for 10 specific SKUs - Rule 11', true, ARRAY[]::TEXT[],
             false, ARRAY['vip'], false, ARRAY['item_015','item_046','item_064','item_004','item_020','item_054','item_037','item_034','item_090','item_063'], 'rule_expression_11'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'e1f2a3b4-c5d6-4e7f-8a9b-0c1d2e3f4a5b', 'Rule_12_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 12', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_12'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'f2a3b4c5-d6e7-4f8a-9b0c-1d2e3f4a5b6c', 'Rule_13_11Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 11 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 13', false, ARRAY['store_35','store_48','store_3','store_33','store_19','store_22','store_13','store_20','store_31','store_17','store_23'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_13'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'a3b4c5d6-e7f8-4a9b-0c1d-2e3f4a5b6c7d', 'Rule_14_AllStores_AllUsers_7SKUs', 'Targets all stores all users for 7 specific SKUs - Rule 14', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], false, ARRAY['item_017','item_034','item_073','item_054','item_044','item_089','item_058'], 'rule_expression_14'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'b4c5d6e7-f8a9-4b0c-1d2e-3f4a5b6c7d8e', 'Rule_15_14Stores_corporate_account_new_user_vip_AllSKUs', 'Targets 14 specific stores user groups: corporate_account, new_user, vip for all SKUs - Rule 15', false, ARRAY['store_20','store_25','store_26','store_18','store_49','store_39','store_29','store_35','store_46','store_16','store_14','store_48','store_41','store_15'],
             false, ARRAY['corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_15'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'c5d6e7f8-a9b0-4c1d-2e3f-4a5b6c7d8e9f', 'Rule_16_19Stores_premium_vip_AllSKUs', 'Targets 19 specific stores user groups: premium, vip for all SKUs - Rule 16', false, ARRAY['store_3','store_38','store_24','store_47','store_26','store_44','store_36','store_40','store_29','store_23','store_4','store_33','store_17','store_31','store_39','store_42','store_18','store_13','store_15'],
             false, ARRAY['premium','vip'], true, ARRAY[]::TEXT[], 'rule_expression_16'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'd6e7f8a9-b0c1-4d2e-3f4a-5b6c7d8e9f0a', 'Rule_17_12Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 12 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 17', false, ARRAY['store_43','store_11','store_16','store_26','store_25','store_46','store_15','store_32','store_4','store_2','store_17','store_47'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_17'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'e7f8a9b0-c1d2-4e3f-4a5b-6c7d8e9f0a1b', 'Rule_18_AllStores_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: corporate_account, new_user, vip for all SKUs - Rule 18', true, ARRAY[]::TEXT[],
             false, ARRAY['corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_18'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'f8a9b0c1-d2e3-4f4a-5b6c-7d8e9f0a1b2c', 'Rule_19_AllStores_corporate_account_new_user_vip_10SKUs', 'Targets all stores user groups: corporate_account, new_user, vip for 10 specific SKUs - Rule 19', true, ARRAY[]::TEXT[],
             false, ARRAY['corporate_account','new_user','vip'], false, ARRAY['item_096','item_095','item_009','item_049','item_076','item_084','item_032','item_001','item_028','item_019'], 'rule_expression_19'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'a9b0c1d2-e3f4-4a5b-6c7d-8e9f0a1b2c3d', 'Rule_20_18Stores_new_user_vip_AllSKUs', 'Targets 18 specific stores user groups: new_user, vip for all SKUs - Rule 20', false, ARRAY['store_12','store_49','store_23','store_15','store_30','store_40','store_34','store_37','store_20','store_3','store_25','store_48','store_16','store_7','store_42','store_1','store_44','store_19'],
             false, ARRAY['new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_20'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'b0c1d2e3-f4a5-4b6c-7d8e-9f0a1b2c3d4e', 'Rule_21_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 21', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_21'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'c1d2e3f4-a5b6-4c7d-8e9f-0a1b2c3d4e5f', 'Rule_22_13Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 13 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 22', false, ARRAY['store_19','store_4','store_31','store_2','store_40','store_37','store_25','store_5','store_17','store_49','store_36','store_21','store_20'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_22'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'd2e3f4a5-b6c7-4d8e-9f0a-1b2c3d4e5f6a', 'Rule_23_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 23', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_23'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'e3f4a5b6-c7d8-4e9f-0a1b-2c3d4e5f6a7b', 'Rule_24_17Stores_corporate_account_new_user_vip_AllSKUs', 'Targets 17 specific stores user groups: corporate_account, new_user, vip for all SKUs - Rule 24', false, ARRAY['store_25','store_48','store_43','store_23','store_27','store_17','store_46','store_37','store_33','store_36','store_44','store_16','store_14','store_41','store_21','store_2','store_3'],
             false, ARRAY['corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_24'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'f4a5b6c7-d8e9-4f0a-1b2c-3d4e5f6a7b8c', 'Rule_25_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 25', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_25'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'a5b6c7d8-e9f0-4a1b-2c3d-4e5f6a7b8c9d', 'Rule_26_12Stores_corporate_account_vip_AllSKUs', 'Targets 12 specific stores user groups: corporate_account, vip for all SKUs - Rule 26', false, ARRAY['store_43','store_20','store_25','store_48','store_40','store_23','store_3','store_13','store_2','store_41','store_12','store_1'],
             false, ARRAY['corporate_account','vip'], true, ARRAY[]::TEXT[], 'rule_expression_26'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'b6c7d8e9-f0a1-4b2c-3d4e-5f6a7b8c9d0e', 'Rule_27_12Stores_corporate_account_new_user_vip_AllSKUs', 'Targets 12 specific stores user groups: corporate_account, new_user, vip for all SKUs - Rule 27', false, ARRAY['store_28','store_19','store_17','store_37','store_36','store_12','store_48','store_35','store_30','store_33','store_26','store_49'],
             false, ARRAY['corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_27'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'c7d8e9f0-a1b2-4c3d-4e5f-6a7b8c9d0e1f', 'Rule_28_AllStores_new_user_AllSKUs', 'Targets all stores user groups: new_user for all SKUs - Rule 28', true, ARRAY[]::TEXT[],
             false, ARRAY['new_user'], true, ARRAY[]::TEXT[], 'rule_expression_28'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'd8e9f0a1-b2c3-4d4e-5f6a-7b8c9d0e1f2a', 'Rule_29_10Stores_AllUsers_AllSKUs', 'Targets 10 specific stores all users for all SKUs - Rule 29', false, ARRAY['store_31','store_34','store_38','store_2','store_39','store_21','store_44','store_23','store_18','store_10'],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_29'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'e9f0a1b2-c3d4-4e5f-6a7b-8c9d0e1f2a3b', 'Rule_30_AllStores_premium_corporate_account_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, vip for all SKUs - Rule 30', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','vip'], true, ARRAY[]::TEXT[], 'rule_expression_30'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'f0a1b2c3-d4e5-4f6a-7b8c-9d0e1f2a3b4c', 'Rule_31_AllStores_vip_AllSKUs', 'Targets all stores user groups: vip for all SKUs - Rule 31', true, ARRAY[]::TEXT[],
             false, ARRAY['vip'], true, ARRAY[]::TEXT[], 'rule_expression_31'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d', 'Rule_32_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 32', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_32'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'b2c3d4e5-f6a7-4b8c-9d0e-1f2a3b4c5d6e', 'Rule_33_11Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 11 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 33', false, ARRAY['store_32','store_19','store_16','store_17','store_20','store_42','store_26','store_47','store_45','store_39','store_18'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_33'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'c3d4e5f6-a7b8-4c9d-0e1f-2a3b4c5d6e7f', 'Rule_34_12Stores_AllUsers_AllSKUs', 'Targets 12 specific stores all users for all SKUs - Rule 34', false, ARRAY['store_39','store_27','store_26','store_36','store_20','store_41','store_17','store_37','store_3','store_18','store_33','store_15'],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_34'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'd4e5f6a7-b8c9-4d0e-1f2a-3b4c5d6e7f8a', 'Rule_35_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 35', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_35'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'e5f6a7b8-c9d0-4e1f-2a3b-4c5d6e7f8a9b', 'Rule_36_14Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 14 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 36', false, ARRAY['store_1','store_16','store_10','store_2','store_4','store_46','store_43','store_37','store_25','store_34','store_31','store_26','store_33','store_44'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_36'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'f6a7b8c9-d0e1-4f2a-3b4c-5d6e7f8a9b0c', 'Rule_37_AllStores_premium_corporate_account_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, vip for all SKUs - Rule 37', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','vip'], true, ARRAY[]::TEXT[], 'rule_expression_37'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'a7b8c9d0-e1f2-4a3b-4c5d-6e7f8a9b0c1d', 'Rule_38_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 38', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_38'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'b8c9d0e1-f2a3-4b4c-5d6e-7f8a9b0c1d2e', 'Rule_39_17Stores_premium_corporate_account_vip_AllSKUs', 'Targets 17 specific stores user groups: premium, corporate_account, vip for all SKUs - Rule 39', false, ARRAY['store_26','store_24','store_35','store_27','store_37','store_42','store_34','store_10','store_41','store_22','store_15','store_18','store_45','store_43','store_38','store_4','store_48'],
             false, ARRAY['premium','corporate_account','vip'], true, ARRAY[]::TEXT[], 'rule_expression_39'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'c9d0e1f2-a3b4-4c5d-6e7f-8a9b0c1d2e3f', 'Rule_40_15Stores_premium_new_user_vip_AllSKUs', 'Targets 15 specific stores user groups: premium, new_user, vip for all SKUs - Rule 40', false, ARRAY['store_25','store_30','store_12','store_11','store_20','store_47','store_40','store_19','store_35','store_1','store_29','store_31','store_32','store_36','store_46'],
             false, ARRAY['premium','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_40'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'd0e1f2a3-b4c5-4d6e-7f8a-9b0c1d2e3f4a', 'Rule_41_17Stores_AllUsers_AllSKUs', 'Targets 17 specific stores all users for all SKUs - Rule 41', false, ARRAY['store_24','store_16','store_14','store_34','store_26','store_41','store_22','store_2','store_49','store_40','store_44','store_1','store_10','store_33','store_43','store_48','store_13'],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_41'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'e1f2a3b4-c5d6-4e7f-8a9b-0c1d2e3f4a5b', 'Rule_42_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 42', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_42'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'f2a3b4c5-d6e7-4f8a-9b0c-1d2e3f4a5b6c', 'Rule_43_19Stores_premium_new_user_vip_AllSKUs', 'Targets 19 specific stores user groups: premium, new_user, vip for all SKUs - Rule 43', false, ARRAY['store_12','store_1','store_44','store_4','store_37','store_41','store_33','store_46','store_24','store_3','store_49','store_45','store_34','store_16','store_39','store_26','store_22','store_29','store_36'],
             false, ARRAY['premium','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_43'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'a3b4c5d6-e7f8-4a9b-0c1d-2e3f4a5b6c7d', 'Rule_44_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 44', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_44'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'b4c5d6e7-f8a9-4b0c-1d2e-3f4a5b6c7d8e', 'Rule_45_15Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 15 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 45', false, ARRAY['store_21','store_12','store_42','store_4','store_38','store_36','store_11','store_41','store_45','store_46','store_20','store_44','store_1','store_2','store_31'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_45'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'c5d6e7f8-a9b0-4c1d-2e3f-4a5b6c7d8e9f', 'Rule_46_12Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 12 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 46', false, ARRAY['store_49','store_19','store_45','store_4','store_35','store_11','store_29','store_47','store_43','store_25','store_27','store_40'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_46'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'd6e7f8a9-b0c1-4d2e-3f4a-5b6c7d8e9f0a', 'Rule_47_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 47', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_47'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'e7f8a9b0-c1d2-4e3f-4a5b-6c7d8e9f0a1b', 'Rule_48_18Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 18 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 48', false, ARRAY['store_17','store_48','store_10','store_13','store_36','store_28','store_33','store_2','store_31','store_12','store_46','store_26','store_22','store_1','store_11','store_39','store_35','store_20'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_48'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'f8a9b0c1-d2e3-4f4a-5b6c-7d8e9f0a1b2c', 'Rule_49_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 49', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_49'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'a9b0c1d2-e3f4-4a5b-6c7d-8e9f0a1b2c3d', 'Rule_50_10Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 10 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 50', false, ARRAY['store_13','store_10','store_38','store_18','store_35','store_28','store_42','store_22','store_27','store_15'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_50'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'b0c1d2e3-f4a5-4b6c-7d8e-9f0a1b2c3d4e', 'Rule_51_14Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 14 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 51', false, ARRAY['store_49','store_37','store_1','store_4','store_44','store_16','store_34','store_14','store_39','store_10','store_20','store_3','store_23','store_27'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_51'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'c1d2e3f4-a5b6-4c7d-8e9f-0a1b2c3d4e5f', 'Rule_52_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 52', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_52'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'd2e3f4a5-b6c7-4d8e-9f0a-1b2c3d4e5f6a', 'Rule_53_11Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 11 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 53', false, ARRAY['store_34','store_35','store_21','store_19','store_3','store_49','store_15','store_38','store_4','store_10','store_46'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_53'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'e3f4a5b6-c7d8-4e9f-0a1b-2c3d4e5f6a7b', 'Rule_54_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 54', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_54'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'f4a5b6c7-d8e9-4f0a-1b2c-3d4e5f6a7b8c', 'Rule_55_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 55', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_55'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'a5b6c7d8-e9f0-4a1b-2c3d-4e5f6a7b8c9d', 'Rule_56_18Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 18 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 56', false, ARRAY['store_16','store_28','store_1','store_20','store_47','store_17','store_19','store_36','store_11','store_37','store_35','store_27','store_39','store_40','store_13','store_32','store_12','store_45'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_56'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'b6c7d8e9-f0a1-4b2c-3d4e-5f6a7b8c9d0e', 'Rule_57_16Stores_AllUsers_AllSKUs', 'Targets 16 specific stores all users for all SKUs - Rule 57', false, ARRAY['store_24','store_25','store_1','store_45','store_3','store_15','store_12','store_44','store_38','store_23','store_13','store_29','store_46','store_18','store_40','store_48'],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_57'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'c7d8e9f0-a1b2-4c3d-4e5f-6a7b8c9d0e1f', 'Rule_58_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 58', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_58'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'd8e9f0a1-b2c3-4d4e-5f6a-7b8c9d0e1f2a', 'Rule_59_18Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 18 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 59', false, ARRAY['store_15','store_20','store_42','store_35','store_25','store_11','store_17','store_44','store_46','store_33','store_14','store_31','store_41','store_36','store_4','store_37','store_49','store_21'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_59'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'e9f0a1b2-c3d4-4e5f-6a7b-8c9d0e1f2a3b', 'Rule_60_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 60', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_60'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'f0a1b2c3-d4e5-4f6a-7b8c-9d0e1f2a3b4c', 'Rule_61_19Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 19 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 61', false, ARRAY['store_31','store_2','store_48','store_15','store_42','store_23','store_18','store_41','store_19','store_38','store_44','store_16','store_36','store_30','store_35','store_24','store_33','store_20','store_27'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_61'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d', 'Rule_62_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 62', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_62'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'b2c3d4e5-f6a7-4b8c-9d0e-1f2a3b4c5d6e', 'Rule_63_14Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 14 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 63', false, ARRAY['store_35','store_32','store_21','store_48','store_36','store_18','store_2','store_24','store_29','store_11','store_3','store_13','store_22','store_1'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_63'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'c3d4e5f6-a7b8-4c9d-0e1f-2a3b4c5d6e7f', 'Rule_64_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 64', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_64'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'd4e5f6a7-b8c9-4d0e-1f2a-3b4c5d6e7f8a', 'Rule_65_11Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 11 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 65', false, ARRAY['store_25','store_32','store_13','store_45','store_33','store_24','store_3','store_34','store_4','store_41','store_2'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_65'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'e5f6a7b8-c9d0-4e1f-2a3b-4c5d6e7f8a9b', 'Rule_66_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 66', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_66'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'f6a7b8c9-d0e1-4f2a-3b4c-5d6e7f8a9b0c', 'Rule_67_12Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 12 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 67', false, ARRAY['store_29','store_14','store_17','store_13','store_22','store_27','store_39','store_26','store_46','store_3','store_41','store_15'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_67'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'a7b8c9d0-e1f2-4a3b-4c5d-6e7f8a9b0c1d', 'Rule_68_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 68', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_68'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'b8c9d0e1-f2a3-4b4c-5d6e-7f8a9b0c1d2e', 'Rule_69_13Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 13 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 69', false, ARRAY['store_18','store_31','store_25','store_37','store_20','store_17','store_48','store_47','store_12','store_43','store_1','store_23','store_14'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_69'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'c9d0e1f2-a3b4-4c5d-6e7f-8a9b0c1d2e3f', 'Rule_70_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 70', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_70'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'd0e1f2a3-b4c5-4d6e-7f8a-9b0c1d2e3f4a', 'Rule_71_17Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 17 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 71', false, ARRAY['store_18','store_13','store_4','store_48','store_19','store_16','store_36','store_2','store_31','store_26','store_34','store_3','store_47','store_20','store_1','store_37','store_29'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_71'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'e1f2a3b4-c5d6-4e7f-8a9b-0c1d2e3f4a5b', 'Rule_72_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 72', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_72'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'f2a3b4c5-d6e7-4f8a-9b0c-1d2e3f4a5b6c', 'Rule_73_19Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 19 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 73', false, ARRAY['store_12','store_40','store_47','store_1','store_42','store_15','store_38','store_23','store_2','store_11','store_26','store_34','store_30','store_17','store_13','store_37','store_33','store_43','store_46'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_73'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'a3b4c5d6-e7f8-4a9b-0c1d-2e3f4a5b6c7d', 'Rule_74_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 74', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_74'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'b4c5d6e7-f8a9-4b0c-1d2e-3f4a5b6c7d8e', 'Rule_75_15Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 15 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 75', false, ARRAY['store_13','store_35','store_24','store_37','store_20','store_33','store_43','store_2','store_18','store_17','store_31','store_1','store_4','store_49','store_16'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_75'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'c5d6e7f8-a9b0-4c1d-2e3f-4a5b6c7d8e9f', 'Rule_76_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 76', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_76'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'd6e7f8a9-b0c1-4d2e-3f4a-5b6c7d8e9f0a', 'Rule_77_16Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 16 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 77', false, ARRAY['store_24','store_1','store_14','store_11','store_39','store_26','store_49','store_13','store_16','store_4','store_20','store_46','store_47','store_36','store_43','store_17'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_77'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'e7f8a9b0-c1d2-4e3f-4a5b-6c7d8e9f0a1b', 'Rule_78_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 78', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_78'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'f8a9b0c1-d2e3-4f4a-5b6c-7d8e9f0a1b2c', 'Rule_79_18Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 18 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 79', false, ARRAY['store_37','store_19','store_16','store_17','store_32','store_41','store_47','store_40','store_24','store_4','store_25','store_15','store_30','store_35','store_45','store_2','store_13','store_46'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_79'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'a9b0c1d2-e3f4-4a5b-6c7d-8e9f0a1b2c3d', 'Rule_80_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 80', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_80'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'b0c1d2e3-f4a5-4b6c-7d8e-9f0a1b2c3d4e', 'Rule_81_10Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 10 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 81', false, ARRAY['store_3','store_11','store_40','store_12','store_39','store_45','store_4','store_22','store_49','store_26'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_81'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'c1d2e3f4-a5b6-4c7d-8e9f-0a1b2c3d4e5f', 'Rule_82_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 82', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_82'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'd2e3f4a5-b6c7-4d8e-9f0a-1b2c3d4e5f6a', 'Rule_83_13Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 13 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 83', false, ARRAY['store_1','store_23','store_39','store_35','store_13','store_44','store_43','store_17','store_22','store_41','store_25','store_10','store_49'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_83'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'e3f4a5b6-c7d8-4e9f-0a1b-2c3d4e5f6a7b', 'Rule_84_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 84', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_84'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'f4a5b6c7-d8e9-4f0a-1b2c-3d4e5f6a7b8c', 'Rule_85_17Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 17 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 85', false, ARRAY['store_26','store_40','store_24','store_3','store_17','store_38','store_49','store_45','store_25','store_2','store_30','store_43','store_46','store_18','store_12','store_31','store_13'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_85'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'a5b6c7d8-e9f0-4a1b-2c3d-4e5f6a7b8c9d', 'Rule_86_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 86', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_86'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'b6c7d8e9-f0a1-4b2c-3d4e-5f6a7b8c9d0e', 'Rule_87_19Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 19 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 87', false, ARRAY['store_43','store_1','store_18','store_2','store_34','store_14','store_46','store_29','store_19','store_35','store_17','store_16','store_4','store_21','store_39','store_44','store_25','store_20','store_32'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_87'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'c7d8e9f0-a1b2-4c3d-4e5f-6a7b8c9d0e1f', 'Rule_88_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 88', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_88'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'd8e9f0a1-b2c3-4d4e-5f6a-7b8c9d0e1f2a', 'Rule_89_15Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 15 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 89', false, ARRAY['store_4','store_1','store_42','store_46','store_2','store_23','store_29','store_20','store_26','store_45','store_25','store_48','store_36','store_38','store_35'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_89'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'e9f0a1b2-c3d4-4e5f-6a7b-8c9d0e1f2a3b', 'Rule_90_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 90', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_90'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'f0a1b2c3-d4e5-4f6a-7b8c-9d0e1f2a3b4c', 'Rule_91_16Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 16 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 91', false, ARRAY['store_46','store_33','store_38','store_30','store_3','store_26','store_23','store_18','store_12','store_48','store_42','store_40','store_25','store_14','store_32','store_17'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_91'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d', 'Rule_92_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 92', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_92'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'b2c3d4e5-f6a7-4b8c-9d0e-1f2a3b4c5d6e', 'Rule_93_18Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 18 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 93', false, ARRAY['store_4','store_49','store_44','store_24','store_45','store_12','store_25','store_38','store_14','store_33','store_3','store_42','store_31','store_19','store_21','store_43','store_40','store_11'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_93'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'c3d4e5f6-a7b8-4c9d-0e1f-2a3b4c5d6e7f', 'Rule_94_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 94', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_94'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'd4e5f6a7-b8c9-4d0e-1f2a-3b4c5d6e7f8a', 'Rule_95_10Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 10 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 95', false, ARRAY['store_24','store_11','store_25','store_44','store_31','store_30','store_36','store_19','store_29','store_48'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_95'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'e5f6a7b8-c9d0-4e1f-2a3b-4c5d6e7f8a9b', 'Rule_96_AllStores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets all stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 96', true, ARRAY[]::TEXT[],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_96'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'f6a7b8c9-d0e1-4f2a-3b4c-5d6e7f8a9b0c', 'Rule_97_13Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 13 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 97', false, ARRAY['store_24','store_26','store_49','store_15','store_45','store_33','store_14','store_10','store_1','store_38','store_17','store_31','store_47'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_97'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'a7b8c9d0-e1f2-4a3b-4c5d-6e7f8a9b0c1d', 'Rule_98_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 98', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_98'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'b8c9d0e1-f2a3-4b4c-5d6e-7f8a9b0c1d2e', 'Rule_99_15Stores_premium_corporate_account_new_user_vip_AllSKUs', 'Targets 15 specific stores user groups: premium, corporate_account, new_user, vip for all SKUs - Rule 99', false, ARRAY['store_21','store_13','store_15','store_14','store_2','store_4','store_39','store_36','store_23','store_3','store_41','store_46','store_11','store_38','store_25'],
             false, ARRAY['premium','corporate_account','new_user','vip'], true, ARRAY[]::TEXT[], 'rule_expression_99'
         );

INSERT INTO targeting_rules (
    id, name, description, target_all_stores, target_stores,
    target_all_users, target_user_groups, target_all_skus, target_skus, rule_expression
) VALUES (
             'c9d0e1f2-a3b4-4c5d-6e7f-8a9b0c1d2e3f', 'Rule_100_AllStores_AllUsers_AllSKUs', 'Targets all stores all users for all SKUs - Rule 100', true, ARRAY[]::TEXT[],
             true, ARRAY[]::TEXT[], true, ARRAY[]::TEXT[], 'rule_expression_100'
         );
