CREATE TABLE campaigns
(
    id                   UUID PRIMARY KEY,
    name                 VARCHAR(150) NOT NULL,
    description          TEXT,

    start_date           DATE         NOT NULL,
    end_date             DATE         NOT NULL,
    start_time           TIME         NOT NULL,
    end_time             TIME         NOT NULL,

    active               BOOLEAN      NOT NULL DEFAULT TRUE,
    priority             INTEGER      NOT NULL DEFAULT 0 CHECK (priority >= 0),

    targeting_rule_id    UUID         NOT NULL REFERENCES targeting_rules (id),

    modification_type VARCHAR(30) NOT NULL CHECK (modification_type IN ('FLAT', 'INCREASE_ABS', 'DECREASE_ABS', 'PERCENTAGE_DISCOUNT')),
    modification_value DECIMAL(10, 2) NOT NULL,

    created_at           TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at           TIMESTAMPTZ  NOT NULL DEFAULT NOW()

);

CREATE INDEX idx_campaigns_active_dates ON public.campaigns (active, start_date, end_date);
ALTER TABLE public.campaigns SET (autovacuum_vacuum_scale_factor=0.05);


CREATE TABLE targeting_rules (
                                 id UUID PRIMARY KEY,
                                 name VARCHAR(150) NOT NULL,
                                 description TEXT,
                                 target_all_stores BOOLEAN NOT NULL DEFAULT FALSE,
                                 target_stores TEXT[] ,
                                 target_all_users BOOLEAN NOT NULL DEFAULT FALSE,
                                 target_user_groups TEXT[],
                                 target_all_skus BOOLEAN NOT NULL DEFAULT FALSE,
                                 target_skus TEXT[],
                                 rule_expression JSONB,
                                 created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
                                 updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX idx_targeting_rules_target_stores_gin ON targeting_rules USING GIN (target_stores) WHERE target_all_stores = FALSE AND target_stores IS NOT NULL;
CREATE INDEX idx_targeting_rules_target_user_groups_gin ON targeting_rules USING GIN (target_user_groups) WHERE target_all_users = FALSE AND target_user_groups IS NOT NULL;
CREATE INDEX idx_targeting_rules_target_skus_gin ON targeting_rules USING GIN (target_skus) WHERE target_all_skus = FALSE AND target_skus IS NOT NULL;
